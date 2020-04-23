import 'package:flutter/material.dart';
import 'theme.dart';
import 'home.dart';

void main() => runApp(App());


class App extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARTSIDEOUT Demo',
      theme: appTheme,
      home: Home(),
    );
 }
}