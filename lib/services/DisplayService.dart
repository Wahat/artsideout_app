import 'package:artsideout_app/constants/DisplayConstants.dart';
import 'package:flutter/material.dart';

class DisplayService {
  DisplaySize displaySize;

  void updateDisplaySize(context) {
    if (MediaQuery.of(context).size.width > 1200) {
      displaySize = DisplaySize.LARGE;
    } else if (MediaQuery.of(context).size.width > 600) {
      displaySize = DisplaySize.MEDIUM;
    } else {
      displaySize = DisplaySize.SMALL;
    }
  }
}