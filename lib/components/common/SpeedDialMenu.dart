import 'package:artsideout_app/constants/ASORouteConstants.dart';
import 'package:artsideout_app/constants/ColorConstants.dart';
import 'package:artsideout_app/serviceLocator.dart';
import 'package:artsideout_app/services/NavigationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedDialMenu extends StatefulWidget {
  @override
  _SpeedDialMenuState createState() => _SpeedDialMenuState();
}

class _SpeedDialMenuState extends State<SpeedDialMenu> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    final NavigationService _navigationService = serviceLocator<NavigationService>();

    return SpeedDial(
      backgroundColor: ColorConstants.asoPrimary,
      animatedIcon: AnimatedIcons.view_list,
      marginBottom: (height / 20),
      marginRight: (width / 2) - 15,
      children: [
        SpeedDialChild(
            child: Icon(Icons.palette, color: Colors.black),
            backgroundColor: Colors.white,
            label: "Studio Installations",
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              setState(() {
                _navigationService.navigateTo(ASORoutes.arts);
              });
            }),
        SpeedDialChild(
            child: Icon(Icons.event, color: Colors.black),
            backgroundColor: Colors.white,
            label: "Performances",
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              setState(() {
                _navigationService.navigateTo(ASORoutes.activities);
              });
            }),
        SpeedDialChild(
            child: Icon(
              Icons.bookmark,
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            label: "Saved",
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () {
              setState(() {
                _navigationService.navigateTo(ASORoutes.activities);
              });
            }),
      ],
    );
  }
}
