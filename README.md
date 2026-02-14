# 🎰 Casino App

A modular casino application built with **Dart** and **Flutter**, designed to simulate both:

- 🎮 A player-facing casino experience
- 🏦 A casino management system (profit tracking, analytics, and operational metrics)

The project is structured with a clear separation between business logic and user interfaces, allowing the same core engine to power both a fully functional Command-Line Interface (CLI) and a Flutter-based Android app.

---

## 🚀 Project Goals

This project focuses on:

- Implementing complete game logic
- Designing a casino management workflow
- Tracking metrics such as:
  - Profit per day / per game
  - Player win/loss statistics
  - Number of games played per period
- Exploring clean architecture and reusable domain logic
- Building both CLI and mobile interfaces on top of the same core engine

---

## 🖥️ Command-Line Interface (Fully Functional)

The CLI version is currently the most complete implementation.  
It supports:

- Player account simulation
- Game execution (e.g., Blackjack)
- Profit tracking and internal statistics
- Casino management mode

### ▶️ Run the CLI version

```bash
dart run bin/dev.dart
```

---

## 📱 Flutter / Android Version (Work in Progress)

A partially functional **Flutter** application is included, aiming to provide:

- 🎮 A graphical player interface  
- 🔐 An authentication system 
- 🔄 Integration with the same underlying casino engine  
- ♠️ Expanded game support  

This version is currently under development.

### ▶️ Run the Flutter App

```bash
flutter run
```

---

## 🛠️ Technologies Used

- Dart
- Flutter
- Git
- Modular project architecture