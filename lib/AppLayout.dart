import 'package:artsideout_app/components/common/SpeedDialMenu.dart';
import 'package:artsideout_app/serviceLocator.dart';
import 'package:artsideout_app/services/NavigationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'components/common/PlatformSvg.dart';
// Named Routes
import 'package:artsideout_app/constants/ASORouteConstants.dart';
import 'package:artsideout_app/components/common/Sidebar.dart';

class AppLayout extends StatelessWidget {
  final Widget childPage;
  const AppLayout({Key key, this.childPage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService =
        serviceLocator<NavigationService>();
    Widget _buildTabletLayout() {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

      return Stack(children: <Widget>[
        Positioned(
            left: 100,
            right: 0,
            top: 0,
            bottom: 0,
            child: PlatformSvg.asset(
              "assets/icons/asobg.svg",
              fit: BoxFit.fitHeight,
            )),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Row(children: <Widget>[
              Sidebar(),
              Expanded(
                  child: Scaffold(
                      backgroundColor: Colors.transparent,
                      extendBodyBehindAppBar: true,
                      body: childPage))
            ]))
      ]);
    }

    Widget _buildMobileLayout() {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
      return Stack(children: <Widget>[
        PlatformSvg.asset(
          "assets/icons/asobg.svg",
          fit: BoxFit.fitHeight,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: childPage,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: SpeedDialMenu(),
          bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0, 8.0, 8.0, 12.0),
                  child: IconButton(
                    onPressed: () {
                      _navigationService.navigateTo(ASORoutes.home);
                    },
                    icon: Icon(
                      Icons.home,
                      size: 29.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 8.0, 50.0, 12.0),
                  child: IconButton(
                    onPressed: () {
                      _navigationService.navigateTo(ASORoutes.activities);
                    },
                    icon: Icon(
                      Icons.search,
                      size: 28,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ]);
    }

    bool _isLargeScreen = false;
    if (MediaQuery.of(context).size.width > 600) {
      _isLargeScreen = true;
    } else {
      _isLargeScreen = false;
    }
    return _isLargeScreen ? _buildTabletLayout() : _buildMobileLayout();
  }
}
