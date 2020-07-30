import 'package:flutter/material.dart';
import 'package:artsideout_app/routing/routing_constants.dart';
// Pages
import "package:artsideout_app/pages/home/HomePage.dart";
import 'package:artsideout_app/pages/art/MasterArtPage.dart';
import 'package:artsideout_app/pages/activity/MasterActivityPage.dart';
import 'package:artsideout_app/pages/undefined_routes/UndefinedRoute.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case Routes.art:
        return MaterialPageRoute(builder: (_) => MasterArtPage());
      case Routes.activity:
        return MaterialPageRoute(builder: (_) => MasterActivityPage());
      default:
        return MaterialPageRoute(builder: (_) => UndefinedRoute());
    }
  }
}
