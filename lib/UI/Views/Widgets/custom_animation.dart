import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAnimation extends PageRouteBuilder {
  CustomAnimation(GlobalKey navigatorKey, String routName, Object? arguments)
      : super(
          settings: RouteSettings(
            name: routName,
            arguments: arguments,
          ),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            assert(navigatorKey.currentWidget != null);
            assert(navigatorKey.currentWidget is MaterialApp);
            var mtApp = navigatorKey.currentWidget as MaterialApp;
            var routes = mtApp.routes;
            assert(routes!.containsKey(routName));
            return routes![routName]!(context);
          },
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
          transitionDuration: const Duration(seconds: 1),
        );
}
