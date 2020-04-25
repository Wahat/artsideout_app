
import 'package:flutter/material.dart';
class DetailWidget extends StatefulWidget {

  final String data;

  DetailWidget(this.data);

  @override
  _DetailWidgetState createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
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