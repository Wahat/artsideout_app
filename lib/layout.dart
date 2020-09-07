import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Pages
import 'package:artsideout_app/pages/home/HomePage.dart';
import 'package:artsideout_app/components/placeholder.dart';

// Named Routes
import 'package:artsideout_app/routing/routing_constants.dart';

class Layout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LayoutState();
  }
}

class _LayoutState extends State<Layout> {
  int _currentIndex = 0;

  final List<NavigationItem> _barItems = [
    NavigationItem(Icon(Icons.home), Text("Home"), HomePage(), Routes.home),
    NavigationItem(Icon(Icons.map), Text("Map"),
        PlaceholderWidget(Colors.deepOrange), Routes.arts),
    NavigationItem(Icon(Icons.search), Text("Search"),
        PlaceholderWidget(Colors.green), Routes.activities)
  ];

  @override
  Widget build(BuildContext context) {
    Widget _buildTabletLayout() {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
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
    Navigator.pushNamed(context, _barItems[index].route);
  }
}

class NavigationItem {
  Icon icon;
  Text title;
  Widget page;
  String route;

  NavigationItem(this.icon, this.title, this.page, this.route);
}
