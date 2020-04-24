import 'package:artsideout_app/graphql/Installation.dart';
import 'package:artsideout_app/main.dart';
import 'package:flutter/material.dart';
import 'package:artsideout_app/graphql/conf.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'ArtInstallationPage.dart';
import 'ArtDetailWidget.dart';
import 'DetailPage.dart';

class MasterDetailPage extends StatefulWidget {
  @override
  _MasterDetailPageState createState() => _MasterDetailPageState();
}

class _MasterDetailPageState extends State<MasterDetailPage> {
  int selectedValue = 0;
  var isLargeScreen = false;

  List<Installation> listInstallation = List<Installation>();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _fillList();
    });
  }

    _fillList() async {
    InstallationQueries queryInstallation = InstallationQueries();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryInstallation.getAll),
      ),
    );
    if (!result.hasException) {
      for (var i = 0; i < result.data["installations"].length; i++) {
        setState(() {
          listInstallation.add(
            Installation(
              result.data["installations"][i]["title"],
              result.data["installations"][i]["artist"],
              result.data["installations"][i]["zone"],
              result.data["installations"][i]["picture"]["url"]
            ),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        if (MediaQuery.of(context).size.width > 600) {
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }
        return Row(children: <Widget>[
          Expanded(
            child: ListView.builder(
              // Let the ListView know how many items it needs to build.
              itemCount: listInstallation.length,
              // Provide a builder function. This is where the magic happens.
              // Convert each item into a widget based on the type of item it is.
              itemBuilder: (context, index) {
                final item = listInstallation[index];

                return Center(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Image.network(
                          item.pictureUrl,
                          fit: BoxFit.fill,
                        ),
                        ListTile(
                          leading: Text(item.zone),
                          title: Text(item.title),
                          subtitle:
                              Text(item.artist),
                        ),
                        ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('VIEW'),
                              onPressed: () {
                                if (isLargeScreen) {
                                  selectedValue = index;
                                  setState(() {});
                                } else {
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) {
                                      return DetailPage(item.title);
                                    },
                                  ));
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          (isLargeScreen && listInstallation.length != 0)
              ? Expanded(child: ArtDetailWidget(listInstallation[selectedValue].title))
              : Container(),
        ]);
      }),
    );
  }
}

abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline,
    );
  }

  Widget buildSubtitle(BuildContext context) => null;
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  Widget buildTitle(BuildContext context) => Text(sender);

  Widget buildSubtitle(BuildContext context) => Text(body);
}
