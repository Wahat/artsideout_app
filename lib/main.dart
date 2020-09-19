import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Theme and Settings
import 'package:artsideout_app/theme.dart';
import 'package:artsideout_app/layout.dart';
import 'package:flutter/services.dart';
// GraphQL
import 'package:graphql_flutter/graphql_flutter.dart';
import "package:artsideout_app/graphql/GraphQLConfiguration.dart";

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() {
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
        client: graphQLConfiguration.client,
        child: MaterialApp(
          title: 'ARTSIDEOUT',
          theme: appTheme,
          home: Layout(),
        ));
  }
}
