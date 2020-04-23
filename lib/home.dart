import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/MasterArtPage.dart';
import 'placeholder.dart';

class NavigationItem {
  Icon icon;
  Text title;
  Widget page;

  NavigationItem(this.icon, this.title, this.page);
}

final List<NavigationItem> _barItems = [
  NavigationItem(
    Icon(Icons.home), Text("Home"), MasterDetailPage()),
  NavigationItem(
      Icon(Icons.map), Text("Map"), PlaceholderWidget(Colors.deepOrange)),
  NavigationItem(
      Icon(Icons.search), Text("Search"), PlaceholderWidget(Colors.green))
];

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget _buildTabletLayout() {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
      return Scaffold(
        appBar: AppBar(
          title: Text('ARTSIDEOUT Demo - Tablet'),
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
        body: _barItems[_currentIndex].page
      );
    }

    Widget _buildMobileLayout() {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
      return Scaffold(
        appBar: AppBar(
          title: Text('ARTSIDEOUT Demo - Mobile'),
        ),
        body: _barItems[_currentIndex].page, // new
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex: _currentIndex, // new
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
