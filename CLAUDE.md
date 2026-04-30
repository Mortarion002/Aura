# Aura — Project Intelligence Document

> **For any agent picking this up:** read this entire file before touching a single line of code.
> It covers what the app is, the full design spec, every architectural decision, what has been built,
> and exactly what still needs to be done. The phase plan at the bottom is the source of truth.

---

## 1. What Is This App

**Aura** is a Flutter mobile app (Android + iOS) that combines four utilities in a single, beautifully designed shell:

| Tab | Screen | Purpose |
|-----|--------|---------|
| 0 | Clock | Live drum-roll clock for the active city, with date, seconds, sunrise/sunset info |
| 1 | World Clock | 2-column card grid of saved cities with live times, search to add cities |
| 2 | Weather | Real OpenWeatherMap temperature + a rotating orthographic globe + sunrise/sunset arc bar |
| 3 | Timer | Countdown timer with concentric-circle display, orbiting dot, lap list, iOS scroll-wheel duration picker |

The design goal is a **premium, minimal black-and-white app** with orange (`#E8823A`) as the only accent. Think Apple Clock app aesthetic crossed with a design portfolio piece.

---

## 2. Design Reference — The HTML Prototype

The definitive design source is the HTML/JSX prototype the user provided. Three files:

- **`Aura.html`** — full working prototype in React/Babel running in-browser
- **`ios-frame.jsx`** — iOS 26 Liquid Glass device frame (not used directly in Flutter)
- **`tweaks-panel.jsx`** — design tweaks panel (not used in Flutter)

These files live at `c:\Users\resoa\Videos\weather\` (parent of the `aura/` Flutter project).

### Design Palette (from `Aura.html` → `CLR` object)

| Name | Hex | Flutter constant | Usage |
|------|-----|-----------------|-------|
| Black | `#000000` | `kBlack` | Text, active states, nav pills |
| White | `#FFFFFF` | `kWhite` | All screen backgrounds |
| Card | `#EFEFEF` | `kCard` | Card backgrounds, inactive nav buttons |
| Panel | `#E8E8E8` | `kPanel` | Input fills |
| Dim | `#9A9A9A` | `kDim` | Secondary text, inactive icons |
| Orange | `#E8823A` | `kOrange` | Sun icon, sunrise bar, timer dot, active timer button |
| Orange Peach | `#FFB07A` | `kOrangePeach` | Inner globe pin dot |
| Red | `#E25A5A` | `kRed` | World map meridian line |
| Map Grey | `#ADADAD` | `kMapGrey` | World map dots (future use) |

### Typography

- **Font:** Outfit (Google Fonts) — used for everything, no other typeface
- **Drum digits:** 118px, weight 900, letterSpacing −2.36px
- **City name hero:** 46px, weight 900
- **Date label:** 20px, weight 700
- **Seconds:** 36px, weight 800
- **Card time:** 30px, weight 800
- **Card city name:** 14px, weight 600
- **UTC/dim labels:** 11px, weight 400, color kDim
- **Timer display:** 30px, weight 800, letterSpacing −1

---

## 3. Architecture

### Navigation Model

```
AppShell (StatefulWidget)
  └── IndexedStack (keeps all 4 screens alive — critical for timer state)
        ├── 0: ClockScreen(currentNavIndex, onNavigate)  ← owns its own BottomNavBar
        ├── 1: Column[ WorldClockScreen, BottomNavBar ]  ← nav injected by AppShell
        ├── 2: Column[ WeatherScreen, BottomNavBar ]
        └── 3: Column[ TimerScreen, BottomNavBar ]
```

**Why IndexedStack:** The Timer screen must keep running when the user switches tabs. `IndexedStack` keeps all widgets alive in the tree. Navigator.push would lose timer state.

**Why ClockScreen owns its nav:** The HTML prototype embeds the 4 circle nav buttons inside the Clock screen content area (at the very bottom, above the home indicator). Screens 1–3 use a shared `BottomNavBar` injected by `AppShell._withNav()`.

### Feature-First Directory Structure

```
lib/
├── main.dart                          # ProviderScope, SharedPreferences init
├── app_shell.dart                     # 4-screen IndexedStack shell
├── splash_screen.dart                 # Splash (existing, keep)
│
├── core/
│   ├── models/
│   │   ├── city_model.dart            # freezed CityModel(name,country,lat,lon,tzOffsetSeconds)
│   │   ├── city_model.freezed.dart    # generated
│   │   └── city_model.g.dart         # generated
│   ├── network/
│   │   ├── api_endpoints.dart         # OpenWeatherMap URLs
│   │   ├── dio_client.dart            # Riverpod dio provider
│   │   ├── dio_client.g.dart          # generated
│   │   └── network_exceptions.dart
│   ├── storage/
│   │   ├── prefs_provider.dart        # SharedPreferences provider
│   │   └── unit_provider.dart        # TemperatureUnit (C/F) state
│   ├── theme/
│   │   ├── app_theme.dart             # MaterialApp lightTheme, Outfit font, white scaffold
│   │   ├── colors.dart                # all kXxx color constants
│   │   └── text_styles.dart          # AppTextStyles — parameterized methods (see note below)
│   ├── utils/
│   │   ├── date_formatter.dart
│   │   ├── temp_formatter.dart
│   │   ├── timezone_utils.dart
│   │   └── weather_icon_mapper.dart
│   └── widgets/
│       ├── aura_logo.dart             # CustomPainter: geometric A + orbit ring + halo arc
│       ├── bottom_nav_bar.dart        # 4 circle tabs (Clock/Globe/Sun/Timer), 52×52
│       ├── orange_border_scaffold.dart # thin wrapper — plain white Scaffold now
│       ├── retry_error_card.dart
│       ├── toggle_12_24.dart          # Toggle1224 + ToggleCF + shared _SegmentPill
│       └── top_app_bar.dart           # legacy, may be unused
│
├── features/
│   ├── clock/
│   │   ├── presentation/
│   │   │   ├── clock_screen.dart      # REBUILT Phase 1: drum digits, date col, seconds stack,
│   │   │   │                          #   city name hero, sunrise info, embedded BottomNavBar
│   │   │   └── widgets/
│   │   │       └── drum_digit.dart    # REBUILT Phase 2: spring cubic(.34,1.56,.64,1) curve
│   │   └── providers/
│   │       ├── clock_provider.dart    # ActiveCity, SavedCities, Is24HourFormat, clockTicker,
│   │       │                          #   currentCityTime providers
│   │       └── clock_provider.g.dart
│   │
│   ├── world_clock/                   # NEW in Phase 1 (moved from clock/)
│   │   ├── presentation/
│   │   │   ├── world_clock_screen.dart # header + search + 2-col grid (no map)
│   │   │   └── widgets/
│   │   │       └── city_time_card.dart # city card: name, UTC, day/night, time, delete ×
│   │   └── providers/
│   │       ├── world_clock_provider.dart  # worldClockTimesProvider
│   │       └── world_clock_provider.g.dart
│   │
│   ├── weather/
│   │   ├── data/
│   │   │   ├── weather_model.dart     # freezed WeatherModel (API response)
│   │   │   ├── weather_model.freezed.dart
│   │   │   ├── weather_model.g.dart
│   │   │   └── weather_repository.dart # fetches from OpenWeatherMap API
│   │   ├── domain/
│   │   │   └── weather_entity.dart
│   │   └── presentation/
│   │       ├── weather_screen.dart    # PARTIALLY UPDATED Phase 1 (still needs Phase 4 redesign)
│   │       ├── forecast_screen.dart   # secondary screen (push), updated for new TextStyles
│   │       ├── providers/
│   │       │   ├── weather_provider.dart
│   │       │   └── weather_provider.g.dart
│   │       └── widgets/
│   │           ├── dotted_globe.dart  # NEEDS Phase 4: switch to orthographic projection
│   │           └── sunrise_sunset_bar.dart # NEEDS Phase 4: orange arc + filled progress
│   │
│   ├── timer/
│   │   └── presentation/
│   │       └── timer_screen.dart      # BUILT Phase 1: countdown, orbiting dot, lap list,
│   │                                  #   CupertinoPicker sheet — needs Phase 5 polish
│   │
│   └── search_location/              # geocoding/OpenWeatherMap city search (legacy modal)
│       ├── data/
│       │   ├── geocoding_model.dart
│       │   ├── geocoding_model.freezed.dart
│       │   ├── geocoding_model.g.dart
│       │   └── location_repository.dart
│       └── presentation/
│           ├── add_city_modal.dart    # full-screen bottom sheet search (legacy, kept)
│           └── providers/
│               ├── geocoding_provider.dart
│               ├── geocoding_provider.g.dart
│               ├── saved_cities_provider.dart
│               └── saved_cities_provider.g.dart
```

### State Management

Riverpod with `@riverpod` code generation. Key providers:

| Provider | Location | Description |
|----------|----------|-------------|
| `activeCityProvider` | `clock_provider.dart` | Currently selected city (CityModel) |
| `savedCitiesProvider` | `clock_provider.dart` | List of user's saved cities |
| `is24HourFormatProvider` | `clock_provider.dart` | 12h/24h toggle (bool) |
| `clockTickerProvider` | `clock_provider.dart` | Stream<DateTime> every second |
| `currentCityTimeProvider` | `clock_provider.dart` | DateTime for active city |
| `worldClockTimesProvider` | `world_clock_provider.dart` | Map<CityModel, DateTime> for all saved cities |
| `temperatureUnitProvider` | `unit_provider.dart` | C or F (TemperatureUnit enum) |
| `currentWeatherProvider` | `weather_provider.dart` | AsyncValue<WeatherEntity> from API |
| `forecastProvider` | `weather_provider.dart` | forecast data |

### Key Dependencies (pubspec.yaml)

```yaml
flutter_riverpod: ^2.6.1
riverpod_annotation: ^2.6.1   # @riverpod codegen
dio: ^5.8.0+1                  # HTTP
shared_preferences: ^2.5.3    # local persistence
google_fonts: ^6.2.1           # Outfit font
material_symbols_icons: ^4.2795.4
freezed_annotation: ^3.0.0
json_annotation: ^4.9.0
shimmer: ^3.0.0
geolocator: ^14.0.2
flutter_svg: ^2.2.4
```

---

## 4. AppTextStyles API — IMPORTANT

The `AppTextStyles` class uses **parameterized methods**, NOT getters. Old code used `AppTextStyles.cardCity` as a getter returning `TextStyle`. New code calls it as a function:

```dart
// ✅ Correct (new API)
AppTextStyles.cardCity()                         // default size + color
AppTextStyles.cardCity(size: 16, color: kWhite)  // override size and/or color

// ❌ Wrong (old API — will cause "can't assign Function to TextStyle" error)
AppTextStyles.cardCity                           // returns Function, not TextStyle
AppTextStyles.cardCity.copyWith(...)             // crashes: copyWith on Function
```

Available methods:
- `AppTextStyles.drumDigit({size, color})` — 118px/w900
- `AppTextStyles.seconds({size, color})` — 36px/w800
- `AppTextStyles.cityHero({size, color})` — 46px/w900
- `AppTextStyles.dateLabel({size, color})` — 20px/w700
- `AppTextStyles.heroTemperature({size, color})` — 72px/w900
- `AppTextStyles.cardTime({size, color})` — 30px/w800
- `AppTextStyles.cardCity({size, color})` — 14px/w600
- `AppTextStyles.cardUtc({size, color})` — 11px/w400/kDim
- `AppTextStyles.labelSmall({size, color})` — 13px/w600
- `AppTextStyles.timerDisplay({size, color})` — 30px/w800

Legacy getters (`displayHours`, `displayMinutes`, `displaySeconds`, `heroLocation`, `displayUnit`) are kept but return the parameterized default. Use the new methods everywhere.

---

## 5. CityModel

```dart
@freezed
abstract class CityModel with _$CityModel {
  const factory CityModel({
    required String name,
    required String country,
    required double lat,
    required double lon,
    required int timezoneOffsetSeconds,  // NOT hours — full seconds offset from UTC
  }) = _CityModel;
}
```

**Important:** `timezoneOffsetSeconds` is in seconds. e.g. UTC+2 = 7200, UTC-7 = -25200, India UTC+5:30 = 19800.

The default active city is Los Angeles (UTC-7 = -25200 seconds). Initial saved cities: London, Paris, New York, Los Angeles.

The full 18-city catalog (`kAllCities`) lives in `world_clock_screen.dart`. It's used for the search feature. It includes: London, Paris, New York, Los Angeles, Tokyo, Dubai, Sydney, Singapore, São Paulo, Mumbai, Berlin, Cairo, Toronto, Mexico City, Seoul, Amsterdam, Chicago, Hong Kong.

---

## 6. Per-Screen Design Spec (from HTML prototype)

### Screen 0 — Clock

```
SafeArea
├── [16px gap]
├── Row: AuraLogo(32) ←→ Toggle1224
├── [24px gap]
├── Row: [HH drum digits 118px] [16px] [date column: "Mon,\n29 Apr"]
├── Row: [MM drum digits 118px] [seconds stack: prev(faint) / current(bold)]
├── Expanded Column:
│   ├── city.name split word-per-line at 46px/w900
│   ├── [10px gap]
│   ├── Row: [sun/moon icon 14px] ["Xh YYm daylight"]
│   └── "HH:MM → HH:MM" sunrise/sunset times
└── BottomNavBar(currentNavIndex, onNavigate)   ← embedded here, not in AppShell
```

Seconds: two Text widgets stacked vertically — previous second (black 22% opacity) above, current second (full black) below. No drum animation on seconds — instant update.

Sunrise/sunset: approximated from city latitude: `sunriseH = 6 + (34 - lat) * 0.04`, `sunsetH = 20 - (34 - lat) * 0.04`. No real API call for sunrise.

### Screen 1 — World Clock

```
SafeArea
├── Row: AuraLogo(30) ←→ search circle button (36px, black when active)
├── [if searching]:
│   ├── TextField (kCard fill, 16px border radius)
│   └── [if query non-empty]: _SearchResults dropdown (kAllCities filtered, not already saved)
└── GridView 2 columns, gap 10, aspectRatio 1.15
    └── CityTimeCard per city (see below)
    [no BottomNavBar here — injected by AppShell._withNav]
```

**CityTimeCard:**
- Background: black if active city, kCard otherwise
- City name + UTC offset (top-left), × delete button (top-right, 22px circle)
- Day/Night label + icon (bottom-left, above time)
- Time string "HH:MM:SS" at 30px/w800 (bottom)
- Tap card → sets active city

**Search behavior:**
- `kAllCities.where(c => c.name.contains(query) && !savedNames.contains(c.name))`
- Tap result → `savedCitiesProvider.notifier.addCity(city)`, clear query, close dropdown

### Screen 2 — Weather

```
SafeArea
├── Row: AuraLogo(32) ←→ ToggleCF pill
├── [20px gap]
├── Row: date text (left) ←→ big temperature (right, 72px/w900)
├── [GLOBE: centered, oversized, absolute-positioned behind content]
└── SunriseSunsetBar (bottom, above BottomNavBar)
```

**Globe (DottedGlobe):**
- Orthographic (spherical) projection — like the HTML canvas version
- Formula: `cosC = sin(φ0)sin(φ) + cos(φ0)cos(φ)cos(Δλ)` → only draw if `cosC > 0`
- Land detection via continent polygon path PiP (already implemented, needs updating)
- **ROTATING**: `lon0` is animated (full revolution every 60s). Starts at city's longitude, rotates continuously
- City pin: orange dot in center at start. As globe rotates, pin moves to city's actual position
- Canvas size: slightly oversized (width × 1.2) centered on screen, clips behind content
- Dot sizes: land = 2.2px, sea = 1.2px (with opacity)

**SunriseSunsetBar:**
- Labels row: `IconSunrise + "HH:MM am"` left, `"HH:MM pm" + IconSunset` right
- Arc: quadratic bezier path from left edge to right edge, orange fill progress up to sun dot
- Sun dot: kOrange filled circle at current progress position on arc
- Uses real `sunrise`/`sunset` DateTime values from weather API

### Screen 3 — Timer

```
SafeArea
├── Row: AuraLogo(30) — "Timer" — [spacer 30]
├── GestureDetector(onTap: showDurationPicker)
│   └── AnimatedBuilder(orbitCtrl) → CustomPaint(_TimerPainter, 320×320)
├── Expanded: lap list (max 5 laps, LAP TIME / TOTAL TIME columns)
│   └── [if no laps and elapsed==0]: "Tap the clock to set duration"
└── Row: [Lap btn] [Start/Stop btn] [Reset btn]  ← circle buttons, 52×52
    [no BottomNavBar here — injected by AppShell._withNav]
```

**_TimerPainter (Canvas, 320×320):**
- Outer track bg: kCard, strokeWidth 12px
- Countdown arc: black, from -π/2 clockwise, sweep = `(1-progress) × 2π` (shows remaining)
- 60 tick marks in annular gap: major (every 5) = 1.5px/grey, minor = 1px/light grey
- Inner orbit track: kCard, 1.5px
- White centre disc
- Time label: "HH:MM:SS" centered in disc
- Orbiting orange dot: follows inner orbit track, `orbitAngle = orbitCtrl.value × 2π`, full revolution 60s

**Duration picker:**
- `showModalBottomSheet` → 3 `CupertinoPicker` columns (H, M, S)
- Only shown when `_running == false`
- Sets `_duration`, resets elapsed + laps

**Timer state:**
- `dart:async Timer.periodic(1s)` drives the countdown
- `elapsed += 1s` each tick until `elapsed >= duration`
- Lap: records `(elapsed - lastLapElapsed, elapsed)`, max 5 stored, inserts at index 0
- Reset: cancel timer, zero all state

---

## 7. Phase Plan — Status Tracker

### ✅ Phase 1 — Foundation (COMPLETE, pushed)
**Commit:** `ded0252` "Phase 1: Foundation — Aura design system..."

- [x] `colors.dart` — updated to HTML palette (kCard, kOrange, kDim, kRed, kWhite)
- [x] `app_theme.dart` — Outfit font, white scaffold background
- [x] `text_styles.dart` — all styles use Outfit, parameterized methods
- [x] `aura_logo.dart` — CustomPainter: outer orbit ring, halo arc, bold A legs + crossbar
- [x] `bottom_nav_bar.dart` — 4 circle tabs (52×52), Clock/Globe/Sun/Timer icons
- [x] `toggle_12_24.dart` — Toggle1224 + ToggleCF both use shared `_SegmentPill`
- [x] `app_shell.dart` — IndexedStack 4 screens; `_withNav()` wraps screens 1–3
- [x] `clock_screen.dart` — drum digits, date column, seconds stack, city name hero, sunrise info, embedded nav
- [x] `world_clock/` — new feature dir; WorldClockScreen with search + grid (no map)
- [x] `world_clock_provider.dart` — moved from `clock/providers/`
- [x] `city_time_card.dart` — rebuilt with delete button, kCard/kBlack design
- [x] `timer_screen.dart` — full timer: countdown, orbiting dot, lap list, duration picker
- [x] Deleted: `settings/`, old `world_clock_screen.dart`, `drum_clock.dart`, map SVG, compass strip
- [x] Fixed all callers of old TextStyles getter API

### ✅ Phase 2 — Clock Screen Polish (COMPLETE, pushed)
**Commit:** `ea1e591` "Phase 2: Clock Screen polish..."

- [x] `drum_digit.dart` — spring curve `Cubic(0.34, 1.56, 0.64, 1)` incoming, `easeOut` outgoing
- [x] Slide directions: incoming from below (+y), outgoing upward (−y)
- [x] Removed unused `DrumClock` wrapper widget

---

### 🔲 Phase 3 — World Clock Screen (TODO)
**Goal:** Match HTML World Clock screen exactly.

Sub-tasks:
- [ ] **3A** Verify `SavedCities` in `clock_provider.dart` starts with the 4 HTML default cities (London, Paris, New York, Los Angeles) with correct UTC offsets matching `kAllCities`
- [ ] **3B** Confirm `WorldClockScreen` header matches: AuraLogo left, search circle right — check paddings match HTML (14px h-padding, 4px top)
- [ ] **3C** City card polish — verify `aspectRatio: 1.15` feels right on real screen; check time font size 30px fits without overflow
- [ ] **3D** Search results dropdown — check max height, scrollable if > 6 results, proper rounded corners (16px)
- [ ] **3E** Active city tap — card animates to black background smoothly (AnimatedContainer 300ms ✓ already there)
- [ ] **3F** Delete behavior — if deleting the active city, auto-set next city as active (logic already in screen, verify)
- [ ] Commit + push Phase 3

**Files to touch:** `world_clock_screen.dart`, `city_time_card.dart`, `clock_provider.dart`

---

### 🔲 Phase 4 — Weather Screen (TODO)
**Goal:** Rotating orthographic globe + orange arc sunrise bar + layout to match HTML.

Sub-tasks:
- [ ] **4A** Rebuild `DottedGlobe` (`dotted_globe.dart`) — switch from flat halftone to orthographic projection:
  ```dart
  // Orthographic formula (same as HTML canvas):
  final phi0 = lat0 * pi / 180;
  final lam0 = lon0 * pi / 180; // animated lon
  final dl = lam - lam0;
  final cosC = sin(phi0)*sin(phi) + cos(phi0)*cos(phi)*cos(dl);
  if (cosC < 0) continue; // back face — skip
  final x = R * cos(phi) * sin(dl);
  final y = R * (cos(phi0)*sin(phi) - sin(phi0)*cos(phi)*cos(dl));
  ```
  - Draw land dots (size 2.2px) and sea dots (size 1.2px, 22% opacity)
  - City pin: orange halo circle (r=12, 18% opacity) + orange dot (r=6) + black center (r=3.2)
  - Pin is always at `(lat0, cityLon)` — city's actual coordinates, not screen center

- [ ] **4B** Add globe rotation animation in `WeatherScreen`:
  - `AnimationController(_orbitCtrl, duration: 60s, repeat)`
  - `lon0 = cityLon + _orbitCtrl.value * 360`
  - Pass animated `lon0` to `DottedGlobe`
  - Dispose controller properly

- [ ] **4C** Rebuild `SunriseSunsetBar` arc to match HTML:
  - Quadratic bezier `M sp H Q W/2 cy2 W-sp H` (arch shape)
  - Draw dashed track first (grey, strokeDashArray 3 3)
  - Draw orange progress portion from left to sun position
  - Sun dot: orange circle r=6 + peach inner r=3.5
  - Labels below arc: `IconSunrise + "HH:MM am"` left, `"HH:MM pm" + IconSunset` right
  - Baseline horizontal line

- [ ] **4D** Layout updates in `WeatherScreen`:
  - Remove OrangeBorderScaffold → plain white Scaffold
  - Top bar: AuraLogo left + ToggleCF right
  - Date/temp row: date (14px, two lines) left, temperature (72px/w900) right
  - Globe: oversized (`width * 1.2`), absolute positioned behind text content
  - SunriseSunsetBar at bottom, padded 20px sides

- [ ] Commit + push Phase 4

**Files to touch:** `dotted_globe.dart`, `sunrise_sunset_bar.dart`, `weather_screen.dart`, `orange_border_scaffold.dart`

---

### 🔲 Phase 5 — Timer Screen Polish (TODO)
**Goal:** The timer screen was built in Phase 1 as a fully functional stub. This phase polishes and verifies everything.

Sub-tasks:
- [ ] **5A** Verify timer countdown accuracy — `dart:async Timer.periodic` can drift slightly. Consider tracking `startTime = DateTime.now()` when running starts and computing `elapsed = DateTime.now().difference(startTime)` for accuracy
- [ ] **5B** Verify `_TimerPainter` sizing — 320×320 CustomPaint may be too tall on small screens. Consider using `LayoutBuilder` or `AspectRatio(1.0)` to fill available width
- [ ] **5C** Timer finish state — when `elapsed >= duration`, show a brief visual flash (orange background pulse on the arc, or arc color change to orange)
- [ ] **5D** Verify CupertinoPicker bottom sheet looks correct: scrolls smoothly, H/M/S labels above pickers, Set button at bottom
- [ ] **5E** Lap column alignment: "LAP TIME" / "TOTAL TIME" headers should be visible only when laps > 0 (already implemented, verify)
- [ ] Commit + push Phase 5

**Files to touch:** `timer_screen.dart`

---

### 🔲 Phase 6 — Screen Animations + Final Polish (TODO)
**Goal:** Screen enter animation (.screen-enter from HTML), final `flutter analyze` clean pass.

Sub-tasks:
- [ ] **6A** Screen fade-in animation — HTML uses `.screen-enter { animation: fadeIn .28s ease both }` where `fadeIn` goes from `opacity:0, translateX(18px)` to `opacity:1, translateX(0)`. Add this entrance animation to WorldClockScreen, WeatherScreen, TimerScreen. ClockScreen already has its own entrance animation.
- [ ] **6B** Weather screen shimmer — the existing shimmer loading state should use new white palette colors
- [ ] **6C** Final `flutter analyze --no-pub` must show **No issues found** (zero errors, zero warnings, zero infos)
- [ ] **6D** Update memory file at `C:\Users\resoa\.claude\projects\c--Users-resoa-Videos-weather\memory\project_tempora.md` with final status
- [ ] Commit + push Phase 6 (final)

---

## 8. Decisions & Constraints

### What NOT to change
- `CityModel` fields — all providers depend on `timezoneOffsetSeconds` (seconds, not hours)
- `clock_provider.dart` provider names — `.g.dart` files are hand-copied and will break if provider function signatures change without re-running `build_runner`
- `world_clock_provider.g.dart` — this was hand-copied from the old location. If `world_clock_provider.dart` is changed in a way that alters the generated code, you MUST run `flutter pub run build_runner build --delete-conflicting-outputs` to regenerate all `.g.dart` files

### Code Generation
If you change any `@riverpod` provider signature, `@freezed` class, or `@JsonSerializable` class, regenerate:
```bash
cd c:\Users\resoa\Videos\weather\aura
flutter pub run build_runner build --delete-conflicting-outputs
```

### Weather API
- Provider: OpenWeatherMap free tier API 2.5
- API key: stored in `api_endpoints.dart` (check that file for the key constant)
- The weather screen fetches real data for the active city. The globe shows the city's real lat/lon.

### GitHub
- Remote: `https://github.com/Mortarion002/Aura.git`
- Branch: `main`
- Push after every phase: `git push origin main`
- Each phase commit message format: `Phase N: <description>\n\n<bullets>\n\nCo-Authored-By: ...`

### flutter analyze
- Must be **No issues found** before every push
- Run: `flutter analyze --no-pub`
- Common gotchas: `__` double underscore in lambdas (use `_` or named params), calling `AppTextStyles.xxx` without `()`, using old color constants (`kCream`, `kWarmSand`) that no longer exist

### OrangeBorderScaffold
This widget is a kept-for-compat thin wrapper. Phase 4 will inline it into WeatherScreen. Phase 3 and Phase 5 do not touch it.

---

## 9. How to Run

```bash
cd c:\Users\resoa\Videos\weather\aura
flutter pub get
flutter run
```

For a hot-restart after code gen changes:
```bash
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
```

---

## 10. Current State (as of Phase 2 completion)

| Screen | Status | Notes |
|--------|--------|-------|
| Clock | ✅ Functionally complete | Drum digits, date, seconds, city hero, sunrise info, embedded nav — all match HTML |
| World Clock | 🟡 Working, needs Phase 3 verification | Search, grid, city cards all built; needs padding/sizing check |
| Weather | 🟡 Compiles, old globe + bar | Globe is flat halftone (not orthographic), arc is old style — Phase 4 will fix |
| Timer | 🟡 Fully functional, needs Phase 5 polish | Countdown, orbiting dot, laps, duration picker all work |
| Navigation | ✅ Complete | 4-tab IndexedStack, Clock embeds nav, others share nav |
| Design system | ✅ Complete | Outfit font, correct palette, AuraLogo, toggles |
