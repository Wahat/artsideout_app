import 'package:artsideout_app/constants/ASORouteConstants.dart';
import 'package:artsideout_app/constants/ColorConstants.dart';
import 'package:artsideout_app/serviceLocator.dart';
import 'package:artsideout_app/services/NavigationService.dart';
import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {

  @override
  void initState() {
    super.initState();
  }

  final List<_SidebarAction> _sideBarActions = [
    _SidebarAction("Home", Icons.home, ASORoutes.home),
    _SidebarAction("Search", Icons.search, ASORoutes.search),
    _SidebarAction("Studio Installations", Icons.palette, ASORoutes.arts),
    _SidebarAction("Performances", Icons.group, ASORoutes.activities),
    _SidebarAction("Saved", Icons.bookmark, ASORoutes.activities),
  ];

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = serviceLocator<NavigationService>();

    return Container(
      height: MediaQuery.of(context).size.height,
      width: 100,
      decoration: BoxDecoration(
        color: ColorConstants.asoPrimary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
                radius: 35.0,
                backgroundImage: NetworkImage("/assets/common/icon.png")),
          ),
          for ( var action in _sideBarActions )
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(action.icon),
                iconSize: 40.0,
                // tooltip: 'Saved',
                onPressed: () {
                  _navigationService.navigateTo(action.route);
                },
              ),
            ),
        ],
      ),
    );
  }
}

class _SidebarAction {
  String name;
  IconData icon;
  String route;

  _SidebarAction(this.name, this.icon, this.route);
}
