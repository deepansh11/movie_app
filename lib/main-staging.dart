import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/config/config.dart';

import 'main.dart';

void main() {
  var configApp =
      const AppConfig(ProviderScope(child: MyApp()), 'Movie App Staging');

  mainCommon();
  runApp(configApp);
}
