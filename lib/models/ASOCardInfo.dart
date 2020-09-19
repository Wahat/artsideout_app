import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ASOCardInfo {
  String title;
  Color color;
  String imgUrl;
  double imgWidth;
  Widget page;
  String route;

  ASOCardInfo(this.title, this.color, this.imgUrl, this.imgWidth, this.page,
      this.route);
}
