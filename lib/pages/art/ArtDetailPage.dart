import 'package:flutter/material.dart';
import 'package:artsideout_app/components/art/ArtDetailWidget.dart';

class ArtDetailPage extends StatefulWidget {

  final String data;

  ArtDetailPage(this.data);

  @override
  _ArtDetailPageState createState() => _ArtDetailPageState();
}

class _ArtDetailPageState extends State<ArtDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ArtDetailWidget(widget.data),
    );
  }
}