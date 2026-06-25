# 0xEFD15DA7

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev) [![License](https://img.shields.io/badge/License-GPL%20v3-blue)](LICENSE)

Crossplatform messenger based on Flutter.

### About project
0xEFD15DA7 is a real-time chat application designed from the ground up for speed and reliability. The client is written entirely in Dart using the Flutter framework, providing native performance on Windows, Linux, macOS, Android, and iOS from a single codebase. The backend is powered by Go, chosen for its lightweight concurrency model and excellent WebSocket support (ofc also for multistreaming).

### Requirements
 - Flutter SDK 3.29+
 - Dart ^3.12.2
 - Windows 10+ / macOS / Linux
 - brain

### Installation

```bash
git clone https://github.com/ma3rd-nepon/go_dart_e2e.git

cd go_dart_e2e

flutter pub get

```

### Project structure

```
lib/
├── main.dart              # main app file
├── models/                # Модели данных (User, Message, Chat)
├── services/              # Database/WebSocket Utilities
├── screens/               # App screens
├── widgets/               # Widgets
└── utils/                 # Утилиты и константы
```

### Technologies

| Layer | Technology | Implemented By |
|-------|------------|----------------|
| **Frontend** | Flutter, Dart  | ma3rd-nepon |
| **Backend** | Go / SQLite     | MetSunSawedOfWire |
| **Requests** | WebSocket, HTTP | MetSunSawedOfWire |
| **Database** | SQLite, PostgreSQL | MetSunSawedOfWire |
| **State** | setState, Provider, Riverpod | ma3rd-nepon |
| **Auth** | JWT, OAuth 2.0 | ma3rd-nepon |
| **Storage** | Local FS, S3 | MetSunSawedOfWire |
| **Sponsor** | Money | MetSunSawedOfWire |


---



- [Learn Flutter](https://docs.flutter.dev/get-started/learn-flutter)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.