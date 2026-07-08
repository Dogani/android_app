# Profile Dashboard

A Flutter Android app with login, session persistence, dashboards, and a personal bio profile.

## Features

- **Login** — Credentials: `admin` / `admin`
- **Session persistence** — Stays logged in after closing the app (`shared_preferences`)
- **Dashboard** — Stats overview and quick-access cards
- **Personal Bio** — Avatar, bio text, and clickable link buttons
- **Navigation** — Projects, Skills, Contact, Settings, About
- **Animations** — Smooth transitions via `flutter_animate`
- **Modern UI** — Dark theme with `google_fonts`, gradients, and shimmer loading

## Packages Used

| Package | Purpose |
|---------|---------|
| `go_router` | Declarative navigation with auth redirects |
| `provider` | Auth state management |
| `shared_preferences` | Session persistence |
| `google_fonts` | Poppins typography |
| `flutter_animate` | Entrance animations |
| `cached_network_image` | Avatar image caching |
| `shimmer` | Loading placeholders |
| `iconsax` | Modern icon set |
| `url_launcher` | Open external links |

## Prerequisites

1. [Install Flutter](https://docs.flutter.dev/get-started/install)
2. Add Flutter to your PATH
3. Enable Android SDK (Android Studio or command-line tools)

## Setup & Run

```bash
cd C:\Users\peter.dogani\Pictures\android_app

# Generate any missing platform files (safe — won't overwrite lib/)
flutter create --project-name profile_dashboard .

# Install dependencies
flutter pub get

# Run on connected device or emulator
flutter run
```

## App Flow

```
Login (admin/admin)
    ↓
Dashboard (stats + quick access grid)
    ├── Personal Bio (avatar, bio, link buttons)
    ├── Projects
    ├── Skills
    ├── Contact
    ├── Settings (logout)
    └── About
```

## Login Credentials

| Field | Value |
|-------|-------|
| Username | `admin` |
| Password | `admin` |

After login, the session is saved locally. Restarting the app keeps you logged in until you log out from Settings.

## Project Structure

```
lib/
├── main.dart                 # App entry + provider setup
├── router/app_router.dart    # go_router routes + auth guard
├── services/auth_service.dart # Login + session logic
├── theme/app_theme.dart      # Dark theme
├── screens/                  # All app pages
└── widgets/                  # Reusable UI components
```
