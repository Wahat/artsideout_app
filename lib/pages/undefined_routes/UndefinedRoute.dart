import 'package:flutter/material.dart';

class UndefinedRoute extends StatelessWidget {
  final String name;
  const UndefinedRoute({Key key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Route for $name is not defined'),
      ),
    );
  }
}
