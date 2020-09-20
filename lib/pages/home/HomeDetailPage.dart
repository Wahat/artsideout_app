import 'package:artsideout_app/constants/ColorConstants.dart';
import 'package:flutter/material.dart';

class HomeDetailPage extends StatefulWidget {
  HomeDetailPage();

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<HomeDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.previewScreen,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      //body:
    );
  }
}
