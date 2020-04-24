import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'theme.dart';
import 'home.dart';
import "graphql/conf.dart";

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GraphQLProvider(
      client: graphQLConfiguration.client,
      child: CacheProvider(child: App()),
    ),
  );
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
