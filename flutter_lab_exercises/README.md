# Flutter Lab Exercises

This repository contains the completed lab exercises from the Flutter Lab Manual.
Each exercise is organized into its own directory under `lib/` and can be run independently.

## Repository Structure

- `lib/01_dart_basics/` - Dart language fundamentals (Variables, Loops, Conditions)
- `lib/02_widgets/` - Exploring core widgets (Text, Image, Container, Icon)
- `lib/03_layouts/` - Row, Column, and layout structures
- `lib/04_responsive_layoutbuilder/` - Responsive UI using LayoutBuilder
- `lib/05_media_queries/` - Responsive UI using MediaQuery breakpoints
- `lib/06_navigation_standard/` - Multi-file navigation using Navigator.push/pop
- `lib/07_navigation_named_routes/` - Navigation using Named Routes
- `lib/08_stateful_stateless/` - Understanding Stateful vs Stateless widgets
- `lib/09_state_management_provider/` - State management using the Provider package
- `lib/10_custom_widgets/` - Creating reusable custom UI widgets
- `lib/11_theming/` - App-wide styling using ThemeData
- `lib/12_forms_validation/` - Forms with user input validation and error handling
- `lib/13_animations/` - AnimatedOpacity and AnimationController (Scale)

## How to Run an Exercise

Because this repo contains multiple entry points, you must specify the target file using the `-t` flag.

**To run a Flutter UI exercise (e.g., Exercise 2):**

```bash
flutter run -t lib/02_widgets/main.dart
```

**To run the Dart-only exercise (Exercise 1):**

```bash
dart run lib/01_dart_basics/main.dart
```
