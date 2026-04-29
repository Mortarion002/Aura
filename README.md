# Aura — Clock + Weather Intelligence

A precision timekeeping and weather intelligence app built with Flutter, designed around a **retro-futuristic, editorial-industrial** aesthetic.

---

## Screenshots

| Clock | World Clock | Weather | Forecast |
|-------|-------------|---------|----------|
| Hero drum-roll digits | City grid + meridian map | Dotted globe + temp | Hourly strip + daily rows |

---

## Architecture

```
lib/
├── main.dart                     # Entry point, SharedPreferences init
├── app_shell.dart                # Bottom nav + IndexedStack router
├── splash_screen.dart            # Animated staggered letter reveal
│
├── core/
│   ├── models/                   # Shared data models (CityModel)
│   ├── network/                  # Dio client, API endpoints, exceptions
│   ├── storage/                  # SharedPreferences + unit providers
│   ├── theme/                    # Colors, typography (Orbitron/Michroma)
│   ├── utils/                    # DateFormatter, TempFormatter, TimezoneUtils
│   └── widgets/                  # Reusable: BottomNavBar, Toggle, Scaffold
│
├── features/
│   ├── clock/
│   │   ├── presentation/         # ClockScreen, WorldClockScreen
│   │   │   └── widgets/          # DrumClock, DrumDigit, CityTimeCard, WorldMapSvg
│   │   └── providers/            # clockProvider, activeCityProvider
│   │
│   ├── weather/
│   │   ├── data/                 # WeatherRepository, models (JSON ↔ entity)
│   │   ├── domain/               # WeatherEntity, HourlyForecastEntity, DailyForecastEntity
│   │   └── presentation/        # WeatherScreen, ForecastScreen
│   │       ├── providers/        # weatherProvider, forecastProvider
│   │       └── widgets/          # DottedGlobe, SunriseSunsetBar
│   │
│   ├── search_location/
│   │   ├── data/                 # LocationRepository, GeocodingModel
│   │   └── presentation/        # AddCityModal, geocodingProvider
│   │
│   └── settings/
│       └── presentation/         # SettingsScreen (°C/°F toggle)
```

### State Management
- **Riverpod** with code-generated providers (`riverpod_annotation` + `riverpod_generator`).
- `SharedPreferences` is initialized in `main()` and injected via `ProviderScope.overrides`.

### Networking
- **Dio** HTTP client with a centralized interceptor for the API key and base URL.
- OpenWeatherMap Free Tier (2.5) endpoints:
  - `/data/2.5/weather` — current weather by city name or coordinates.
  - `/data/2.5/forecast` — 5-day / 3-hour forecast.
  - `/geo/1.0/direct` — geocoding city search.

---

## Custom UI Elements

### DrumClock
A two-row, four-digit animated clock display using `AnimatedSwitcher` with vertical slide transitions. Each digit independently animates when its value changes, creating a mechanical "drum-roll" effect.

### DottedGlobe
A `CustomPainter` that renders a 3D dotted sphere using spherical-to-Cartesian coordinate projection. An orange pin with a pulsing ring marks the active city's lat/lon. Depth-based dot sizing gives a realistic 3D appearance.

### SunriseSunsetBar
A `CustomPainter` arc showing sunrise and sunset times with a dotted parabolic curve. A solid dot tracks the current time along the arc between the two endpoints.

### CityTimeCard
Animated card tiles in a 2×2 grid. The active card uses a black background with an orange glow shadow, while inactive cards are white. Each card shows city name, UTC offset, day/night emoji, and live-updating time.

---

## Design Language

| Token | Value |
|-------|-------|
| **Primary Font** | Orbitron (display numerals) |
| **Secondary Font** | Michroma (labels, cards) |
| **Background** | Warm gradient `#EFEBE0` → `#DFD1B8` |
| **Accent** | Orange `#FF6500` |
| **Surface** | White `#FFFFFF` |
| **Text Primary** | Black `#000000` |
| **Text Secondary** | iOS System Gray `#8E8E93` |
| **Corner Radius** | 24px (cards), 32px (nav bar) |

---

## Getting Started

### Prerequisites
- Flutter SDK `^3.11.5`
- An OpenWeatherMap API key (free tier)

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

# Production build with custom key
flutter build apk --dart-define=API_KEY=your_key_here
```

### Run Tests

```bash
flutter test
```

---

## API Configuration

The API key is configured in `lib/core/network/api_endpoints.dart` using `String.fromEnvironment` with a development fallback:

```dart
static const String apiKey = String.fromEnvironment(
  'API_KEY',
  defaultValue: 'your_dev_key_here',
);
```

For production, override via `--dart-define=API_KEY=...` at build time.

---

## Dependencies

| Package | Purpose |
|---------|---------|
| `flutter_riverpod` | State management |
| `riverpod_annotation` | Code-generated providers |
| `dio` | HTTP client |
| `shared_preferences` | Local persistence |
| `google_fonts` | Orbitron + Michroma typography |
| `material_symbols_icons` | Modern icon set |
| `shimmer` | Loading skeleton animations |
| `geolocator` | Device location services |
| `freezed_annotation` | Immutable model classes |
| `json_annotation` | JSON serialization |

---

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
