import 'package:artsideout_app/layout.dart';
import 'package:artsideout_app/pages/home/HomePage.dart';
import 'package:artsideout_app/pages/art/MasterArtPage.dart';

final appRoutes = {
  // When navigating to the "/" route, build the FirstScreen widget.
  '/': (context) => Layout(),
  // When navigating to the "/second" route, build the SecondScreen widget.
  '/home': (context) => HomePage(),
};
