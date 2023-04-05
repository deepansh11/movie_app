# Movie App
Movie app for Source.one interview task

## Getting Started

This project has flavors enabled and a launch.json file to tell VS Code to run development flavor by default, so in order to run the project -

1. `flutter pub get`
2. `flutter run --flavor development -t lib/main-dev.dart` to run the development mode
3. `flutter run --flavor production -t lib/main.dart` to run the production mode

The project uses _Riverpod_ as the State management solution and also contains Dynamic theme based on the mode of the device along with all the features :-

1. Poster
2. Score
3. Trailer in YouTube
4. Bottom Navigation Bar
5. Parallax Effect on Scroll
6. Shimmers on loading

This Project also includes some basic testing, using `flutter test`
