import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/MasterArtPage.dart';
import 'placeholder.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

// if (MediaQuery.of(context).size.width > 600) {
//           isLargeScreen = true;
//         } else {
//           isLargeScreen = false;
//         }
// return isLargeScreen? _buildTabletLayout() : _buildMobileLayout();

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    MasterDetailPage(),
    PlaceholderWidget(Colors.deepOrange),
    PlaceholderWidget(Colors.green)
  ];
  @override
  Widget build(BuildContext context) {
    Widget _buildTabletLayout() {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
      return Scaffold(
        appBar: AppBar(
          title: Text('ARTSIDEOUT Demo - Tablet'),
        ),
        body: _children[_currentIndex], // new
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex: _currentIndex, // new
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text('Map'),
            ),
            new BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('Search'))
          ],
        ),
      );
    }

    Widget _buildMobileLayout() {
      SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
      return Scaffold(
        appBar: AppBar(
          title: Text('ARTSIDEOUT Demo - Mobile'),
        ),
        body: _children[_currentIndex], // new
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped, // new
          currentIndex: _currentIndex, // new
          items: [
            new BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            new BottomNavigationBarItem(
              icon: Icon(Icons.map),
              title: Text('Map'),
            ),
            new BottomNavigationBarItem(
                icon: Icon(Icons.search), title: Text('Search'))
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
