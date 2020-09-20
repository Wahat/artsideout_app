import 'package:artsideout_app/components/common/Placeholder.dart';
import 'package:artsideout_app/pages/activity/ActivityDetailPage.dart';
import 'package:flutter/material.dart';
import 'package:artsideout_app/constants/ASORouteConstants.dart';
// Main pages
import "package:artsideout_app/pages/home/HomePage.dart";
import 'package:artsideout_app/pages/art/MasterArtPage.dart';
import 'package:artsideout_app/pages/activity/MasterActivityPage.dart';
import 'package:artsideout_app/pages/undefined_routes/UndefinedRoute.dart';

// Detailed pages
import 'package:artsideout_app/pages/art/ArtDetailPage.dart';

class ASORouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;
    final parts = settings.name.split('?');
    // final args = (settings.arguments);
    switch (parts[0]) {
      case ASORoutes.home:
        builder = (BuildContext context) => HomePage();
        break;
      case ASORoutes.arts:
        var pageRoute;
        if (parts.length == 2) {
          String artDetails = parts[1].substring(3);
          pageRoute = ArtDetailPage(artDetails);
        } else if (parts.length == 1) {
          pageRoute = MasterArtPage();
        }
        builder = (BuildContext context) => pageRoute;
        break;
      case ASORoutes.activities:
        var pageRoute;
        if (parts.length == 2) {
          String activityDetails = parts[1].substring(3);
          pageRoute = ActivityDetailPage(activityDetails);
        } else if (parts.length == 1) {
          pageRoute = MasterActivityPage();
        }
        builder = (BuildContext context) => pageRoute;
        break;
      case ASORoutes.search:
        builder = (BuildContext context) => PlaceholderWidget(Colors.amber);
        break;
      case ASORoutes.undefinedRoute:
      default:
        builder = (BuildContext context) => UndefinedRoute();
    }
    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
