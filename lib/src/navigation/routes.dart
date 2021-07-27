import 'package:flutter/material.dart';
import 'package:muevete/src/ui/pages/logged_page.dart';
import 'package:muevete/src/ui/pages/splash.dart';
import 'package:muevete/src/ui/pages/unlogged_page.dart';

class Routes {
  static const splash = '/';
  static const unlogged = '/unlogged';
  static const logged = '/logged';

  static Route routes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splash:
        return _buildRoute(SplashPage());
      case unlogged:
        return _buildRoute(UnloggedPage());
      case logged:
        return _buildRoute(LoggedPage());
      default:
        throw Exception('Route does not exist');
    }
  }

  static MaterialPageRoute _buildRoute(Widget build) =>
      MaterialPageRoute(builder: (context) => build);
}
