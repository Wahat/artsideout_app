import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> navigateToWithId(String routeName, String argument) {
    return navigatorKey.currentState.pushNamed(
        "$routeName?id=$argument",
        arguments: (argument));
  }

  void goBack(){
    return navigatorKey.currentState.pop();
  }
}