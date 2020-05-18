import 'package:flutter/material.dart';

class ArtDetailWidget extends StatefulWidget {
  final String data;

  ArtDetailWidget(this.data);

  @override
  _ArtDetailWidgetState createState() => _ArtDetailWidgetState();
}

class _ArtDetailWidgetState extends State<ArtDetailWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.data,
              style: TextStyle(
                  fontSize: 36.0, color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
