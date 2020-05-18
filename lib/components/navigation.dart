import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:artsideout_app/components/placeholder.dart';
import 'package:artsideout_app/pages/home/HomePage.dart';

class NavigationItem {
  Icon icon;
  Text title;
  Widget page;

  NavigationItem(this.icon, this.title, this.page);
}

final List<NavigationItem> _barItems = [
  NavigationItem(Icon(Icons.home), Text("Home"), HomePage()),
  NavigationItem(
      Icon(Icons.map), Text("Map"), PlaceholderWidget(Colors.deepOrange)),
  NavigationItem(
      Icon(Icons.search), Text("Search"), PlaceholderWidget(Colors.green))
];

class ASOAppBar extends StatefulWidget implements PreferredSizeWidget {
  ASOAppBar({Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _ASOAppBarState createState() => _ASOAppBarState();
}

class _ASOAppBarState extends State<ASOAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: <Widget>[
        for (var i = 0; i < _barItems.length; i++)
          IconButton(
            icon: _barItems[i].icon,
            onPressed: () {
              onTabTapped(context,i);
            },
          ),
      ],
    );
  }
}

void onTabTapped(context, int index) {
  Navigator.push(context, CupertinoPageRoute(
    builder: (context) {
      return _barItems[index].page;
    },
  ));
}
