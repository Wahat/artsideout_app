
import 'package:flutter/material.dart';
class HomeDetailWidget extends StatefulWidget {

  final String data;

  HomeDetailWidget(this.data);

  @override
  _HomeDetailWidgetState createState() => _HomeDetailWidgetState();
}

class _HomeDetailWidgetState extends State<HomeDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.data, style: TextStyle(fontSize: 36.0, color: Theme.of(context).primaryColor),),
          ],
        ),
      ),
    );
  }
}