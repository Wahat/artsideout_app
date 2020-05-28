import 'package:flutter/material.dart';
import 'package:artsideout_app/graphql/Installation.dart';

class ArtDetailWidget extends StatefulWidget {
  final Installation data;

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
              widget.data.title,
              style: TextStyle(
                  fontSize: 36.0, color: Theme.of(context).primaryColor),
            ),
            Text(
              widget.data.zone,
              style: TextStyle(
                  fontSize: 36.0, color: Theme.of(context).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
