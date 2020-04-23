import 'package:flutter/material.dart';
import 'theme.dart';
import 'home.dart';

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;


Future<void> fetchAlbum() async {
  final response = await http.get(
    'https://cdn.contentful.com/spaces/lxvjppx3rl7e/environments/master/content_types?',
    headers: {'access_token': "Eo9ZoWWJOxZYRXnjvgkRAwzrlwG9fNXIo6po6cTaE3I"},
  );
  final responseJson = json.decode(response.body);
  print(responseJson);
}


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  fetchAlbum();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ARTSIDEOUT Demo',
      theme: appTheme,
      home: Home(),
    );
  }
}