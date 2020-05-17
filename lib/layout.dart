import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:artsideout_app/HomePage.dart';
import 'package:artsideout_app/placeholder.dart';

class Layout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LayoutState();
  }
}

class _LayoutState extends State<Layout> {
  int _currentIndex = 0;

  final List<NavigationItem> _barItems = [
    NavigationItem(Icon(Icons.home), Text("Home"), HomePage()),
    NavigationItem(
        Icon(Icons.map), Text("Map"), PlaceholderWidget(Colors.deepOrange)),
    NavigationItem(
        Icon(Icons.search), Text("Search"), PlaceholderWidget(Colors.green))
  ];

  @override
  Widget build(BuildContext context) {
    Widget _buildTabletLayout() {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
      return Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              for (var i = 0; i < _barItems.length; i++)
                IconButton(
                  icon: _barItems[i].icon,
                  onPressed: () {
                    onTabTapped(i);
                  },
                ),
            ],
          ),
          body: _barItems[_currentIndex].page);
    }

    Widget _buildMobileLayout() {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
      return Scaffold(
        body: _barItems[_currentIndex].page,
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: [
            for (var i = 0; i < _barItems.length; i++)
              BottomNavigationBarItem(
                icon: _barItems[i].icon,
                title: _barItems[i].title,
              )
          ],
        ),
      );
    }

    bool _isLargeScreen = false;
    if (MediaQuery.of(context).size.width > 600) {
      _isLargeScreen = true;
    } else {
      _isLargeScreen = false;
    }
    return _isLargeScreen ? _buildTabletLayout() : _buildMobileLayout();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}

class NavigationItem {
  Icon icon;
  Text title;
  Widget page;

  NavigationItem(this.icon, this.title, this.page);
}
