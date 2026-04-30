# Aura

A premium Flutter app combining four utilities — **Clock**, **World Clock**, **Weather**, and **Timer** — in a single, minimal black-and-white shell with orange as the only accent.

---

## Screens

| Tab | Screen | Description |
| --- | ------ | ----------- |
| 0 | Clock | Live drum-roll digits for the active city, date, animated seconds, city name, sunrise/sunset info |
| 1 | World Clock | 2-column card grid of saved cities with live times; search any city or detect via GPS |
| 2 | Weather | Real temperature from OpenWeatherMap, rotating orthographic globe, sunrise/sunset arc bar |
| 3 | Timer | Countdown with concentric-circle display, orbiting dot, lap tracking, duration picker, alarm sound |

---

## Design System

| Token | Value |
| ----- | ----- |
| Font | Outfit (all weights, Google Fonts) |
| Background | White `#FFFFFF` |
| Card | `#EFEFEF` |
| Accent | Orange `#E8823A` |
| Dim text | `#9A9A9A` |
| Active / text | Black `#000000` |

The design follows a premium, minimal aesthetic — think Apple Clock crossed with a design portfolio piece. Orange is the only colour used for interactive and live elements (sun icon, timer dot, sunrise arc, active timer button).

---

## Architecture

```
lib/
├── main.dart                          # ProviderScope, SharedPreferences pre-load
├── app_shell.dart                     # IndexedStack — keeps all 4 screens alive
├── splash_screen.dart
│
├── core/
│   ├── models/city_model.dart         # Freezed CityModel (name, country, lat, lon, timezoneOffsetSeconds)
│   ├── network/                       # Dio client, API endpoints, exceptions
│   ├── storage/                       # SharedPreferences provider, temperature unit
│   ├── theme/                         # colors.dart, text_styles.dart, app_theme.dart
│   ├── utils/                         # DateFormatter, TempFormatter, TimezoneUtils
│   └── widgets/                       # AuraLogo, BottomNavBar, Toggle1224/ToggleCF, ScreenEnter
│
└── features/
    ├── clock/
    │   ├── presentation/clock_screen.dart       # Drum digits, date, seconds, city hero, sunrise
    │   ├── presentation/widgets/drum_digit.dart # Spring-curve animated digit
    │   └── providers/clock_provider.dart        # ActiveCity, SavedCities, Is24HourFormat (all persisted)
    │
    ├── world_clock/
    │   ├── presentation/world_clock_screen.dart # Grid + OWM search + GPS location button
    │   ├── presentation/widgets/city_time_card.dart
    │   └── providers/world_clock_provider.dart
    │
    ├── weather/
    │   ├── data/                                # WeatherRepository, WeatherModel (freezed)
    │   ├── domain/weather_entity.dart
    │   └── presentation/
    │       ├── weather_screen.dart              # Globe + temp + sunrise bar
    │       ├── widgets/dotted_globe.dart        # Orthographic CustomPainter
    │       ├── widgets/sunrise_sunset_bar.dart  # Arc CustomPainter
    │       └── providers/weather_provider.dart
    │
    ├── timer/
    │   └── presentation/timer_screen.dart       # Countdown, orbit dot, laps, alarm dialog
    │
    └── search_location/
        ├── data/                                # GeocodingModel, LocationRepository
        └── presentation/providers/
            └── geocoding_provider.dart          # OWM geocoding + timezone lookup, 300ms debounce
```

### Navigation

`IndexedStack` keeps all four screens alive simultaneously — critical so the timer keeps running when the user switches tabs. `ClockScreen` owns its own `BottomNavBar` embedded at the bottom of its content. Screens 1–3 receive a shared `BottomNavBar` injected by `AppShell`.

### State Management

Riverpod with `@riverpod` code generation. All user state is persisted to `SharedPreferences` on every mutation and restored on app start.

| Provider | Persisted | Description |
| -------- | --------- | ----------- |
| `activeCityProvider` | Yes | Currently selected city (JSON) |
| `savedCitiesProvider` | Yes | User's city list (JSON array) |
| `is24HourFormatProvider` | Yes | 12h / 24h toggle |
| `clockTickerProvider` | — | `Stream<DateTime>` every second |
| `currentCityTimeProvider` | — | Computed time for active city timezone |
| `worldClockTimesProvider` | — | Live map of times for all saved cities |
| `temperatureUnitProvider` | — | °C / °F toggle |
| `currentWeatherProvider` | — | `AsyncValue<WeatherEntity>` from OWM |
| `geocodingSearchProvider` | — | OWM city search with debounce |

---

## Key Features

### Drum-Roll Clock

Each digit animates independently on change using a spring cubic curve `Cubic(0.34, 1.56, 0.64, 1)` for the incoming digit and `easeOut` for the outgoing one. Seconds show a two-line stack (previous faint above, current bold below) with no animation.

### World Clock — GPS + Global Search

Two ways to add a city:

- **Search** — powered by OpenWeatherMap's geocoding API. Finds any city worldwide (Kanpur, São Paulo, etc.), not just a hardcoded list. A 300ms debounce prevents excessive API calls. Each result fetches the city's timezone via the weather API.
- **Location button** — requests device GPS, reverse-geocodes via OWM weather-by-coords, and adds the detected city as the active city.

### Weather

The weather screen always shows data for the **active city** selected in the World Clock. The dotted globe uses orthographic projection and rotates continuously (full revolution every 60 s), with an orange city pin at the real lat/lon.

### Timer Alarm

When the countdown reaches zero:

1. `freiren.m4a` plays via `audioplayers`.
2. A dialog pops up — "Time's Up!" with a **Stop** button.
3. Tapping Stop silences the alarm and dismisses the dialog.
4. The reset button also stops the alarm at any point.

---

## Permissions

### Android

```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />
<uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
```

### iOS (`Info.plist`)

```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>Used to detect your current city for the world clock and weather.</string>
```

---

## Getting Started

### Prerequisites

- Flutter SDK `^3.11.5`
- An OpenWeatherMap free-tier API key

### Installation

```bash
git clone https://github.com/Mortarion002/Aura.git
cd aura
flutter pub get
```

### Run

```bash
# Development (uses built-in fallback API key)
flutter run

# Production build with your own key
flutter build apk --dart-define=API_KEY=your_key_here
```

> **Note:** `audioplayers` and `geolocator` are native plugins. After cloning or adding these packages, always do a full `flutter run` — hot reload alone will not register native code.

---

## Dependencies

| Package | Purpose |
| ------- | ------- |
| `flutter_riverpod` | State management |
| `riverpod_annotation` | `@riverpod` code generation |
| `dio` | HTTP client |
| `shared_preferences` | Persistent local storage |
| `google_fonts` | Outfit typeface |
| `material_symbols_icons` | Icon set |
| `shimmer` | Loading skeleton |
| `geolocator` | Device GPS |
| `audioplayers` | Timer alarm sound |
| `freezed_annotation` | Immutable model classes |
| `json_annotation` | JSON serialization |
| `flutter_svg` | SVG rendering |

---

## API

All data comes from **OpenWeatherMap free tier (v2.5)**:

| Endpoint | Used for |
| -------- | -------- |
| `/data/2.5/weather` | Current weather by city name or lat/lon |
| `/data/2.5/forecast` | 5-day / 3-hour forecast |
| `/geo/1.0/direct` | City name → lat/lon (search) |

The API key is configured in `lib/core/network/api_endpoints.dart` via `String.fromEnvironment` with a development fallback. Override at build time with `--dart-define=API_KEY=your_key`.

---

## License

MIT — see [LICENSE](LICENSE).
