import 'package:artsideout_app/constants/ColorConstants.dart';
import 'package:artsideout_app/models/ASOCardInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// Home
import 'package:artsideout_app/components/home/HomeDetailWidget.dart';
// Routes
import 'package:artsideout_app/constants/ASORouteConstants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int secondFlexSize = 1;
  bool isLargeScreen = false;
  bool isMediumScreen = false; // tablet

  @override
  void initState() {
    super.initState();
  }

  final List<ASOCardInfo> listHomeActions = [
    ASOCardInfo("About Connections", Color(0xFF62BAA6), "assets/home/about.png",
        350, ASORoutes.activities),
    ASOCardInfo("Event Information", ColorConstants.asoPrimary, "assets/home/event.png", 300,
        ASORoutes.activities),
    ASOCardInfo("News", Colors.purple[200], "assets/home/news.png", 300,
        ASORoutes.activities),
    ASOCardInfo("Studio\nInstallations", Colors.blue[200],
        "assets/home/installations.png", 200, ASORoutes.arts),
    ASOCardInfo("Schedule", Colors.yellow[200], "assets/home/schedule.png", 300,
        ASORoutes.activities),
    ASOCardInfo("Performances", Colors.yellow[200],
        "assets/home/performances.png", 300, ASORoutes.activities),
    ASOCardInfo("Saved", Colors.orange[200], "assets/icons/saved.svg", 200,
        ASORoutes.arts)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.asoScaffold,
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (MediaQuery.of(context).size.width > 1200) {
            secondFlexSize = 6;
            isLargeScreen = true;
            isMediumScreen = false;
          } else if (MediaQuery.of(context).size.width > 600) {
            secondFlexSize = 5;
            isLargeScreen = true;
            isMediumScreen = true;
          } else {
            isLargeScreen = false;
            isMediumScreen = false;
          }
          return Row(children: <Widget>[
            Expanded(
              flex: secondFlexSize,
              child: HomeDetailWidget(
                  isMediumScreen, isLargeScreen, listHomeActions),
            ),
            (isLargeScreen)
                ? Expanded(
                    flex: 3,
                    child: Center(
                      child: Container(
                        child: Text("Hello Bye"),
                      ),
                    ))
                : Container()
          ]);
        },
      ),
    );
  }
}
