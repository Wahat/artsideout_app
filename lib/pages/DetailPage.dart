import 'package:flutter/material.dart';
import 'package:artsideout_app/pages/DetailWidget.dart';

class DetailPage extends StatefulWidget {

  final String data;

  DetailPage(this.data);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DetailWidget(widget.data),
    );
  }
}