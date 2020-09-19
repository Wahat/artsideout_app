import 'package:artsideout_app/components/card.dart';
import 'package:artsideout_app/pages/activity/ActivityDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:artsideout_app/routing/routing_constants.dart';
// Main pages
import "package:artsideout_app/pages/home/HomePage.dart";
import 'package:artsideout_app/pages/art/MasterArtPage.dart';
import 'package:artsideout_app/pages/activity/MasterActivityPage.dart';
import 'package:artsideout_app/pages/undefined_routes/UndefinedRoute.dart';

// Detailed pages
import 'package:artsideout_app/pages/art/ArtDetailPage.dart';

class ASORouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final parts = settings.name.split('?');
    final args = (settings.arguments);
    switch (parts[0]) {
      //  main routes
      case Routes.home:
        return MaterialPageRoute(
            builder: (context) => HomePage(), settings: settings);
      case Routes.arts:
        var pageRoute;
        if (parts.length == 2) {
          String artDetails = parts[1].substring(3);
          pageRoute = ArtDetailPage(artDetails);
        } else if (parts.length == 1) {
          pageRoute = MasterArtPage();
        }
        return MaterialPageRoute(
            builder: (context) => pageRoute, settings: settings);

      // case Routes.activities:
      //   return MaterialPageRoute(
      //       builder: (context) => MasterActivityPage(), settings: settings);

      case Routes.activities:
        final String activityDetails = args;
        var pageRoute;
        if (parts.length == 2) {
          pageRoute = ActivityDetailPage(activityDetails);
        } else if (parts.length == 1) {
          pageRoute = MasterActivityPage();
        }
        return MaterialPageRoute(
            builder: (context) => pageRoute, settings: settings);

      // unknown page
      default:
        return MaterialPageRoute(builder: (context) => UndefinedRoute());
    }
  }
}
