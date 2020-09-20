import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// Theme and Settings
import 'package:artsideout_app/theme.dart';
// GraphQL
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:artsideout_app/services/GraphQLConfiguration.dart';
// Routing
import 'package:artsideout_app/routing/ASORouter.dart';
import 'package:artsideout_app/constants/ASORouteConstants.dart';
import 'package:artsideout_app/services/NavigationService.dart';
import 'package:artsideout_app/serviceLocator.dart';
import 'package:artsideout_app/AppLayout.dart';

GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() {
  // Google Fonts License
  LicenseRegistry.addLicense(() async* {
    final license = await rootBundle.loadString('google_fonts/OFL.txt');
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<NavigatorState> _navigatorKey =
        serviceLocator<NavigationService>().navigatorKey;
    return GraphQLProvider(
        client: graphQLConfiguration.client,
        child: MaterialApp(
          title: 'ARTSIDEOUT',
          theme: appTheme,
          navigatorKey: _navigatorKey,
          builder: (context, child) => WillPopScope(
            onWillPop: () async {
              if (_navigatorKey.currentState.canPop()) {
                _navigatorKey.currentState.pop();
                return false;
              }
              return true;
            },
            child: AppLayout(childPage: child),
          ),
          initialRoute: ASORoutes.home,
          onGenerateRoute: ASORouter.generateRoute,
        ));
  }
}
