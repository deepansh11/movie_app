import 'package:flutter/cupertino.dart';

class AppConfig extends InheritedWidget {
  const AppConfig(Widget child, this.appDisplayName, {Key? key})
      : super(key: key, child: child);

  final String appDisplayName;

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>(
        aspect: AppConfig);
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
