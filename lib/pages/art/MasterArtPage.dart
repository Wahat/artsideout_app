import 'package:flutter/material.dart';
// GraphQL
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:artsideout_app/graphql/config.dart';
import 'package:artsideout_app/graphql/Installation.dart';
// Common
import 'package:artsideout_app/components/pageHeader.dart';
import 'package:artsideout_app/components/card.dart';
// Art
import 'package:artsideout_app/components/art/ArtDetailWidget.dart';
import 'package:artsideout_app/pages/art/ArtDetailPage.dart';

class MasterArtPage extends StatefulWidget {
  @override
  _MasterArtPageState createState() => _MasterArtPageState();
}

class _MasterArtPageState extends State<MasterArtPage> {
  int selectedValue = 0;
  int secondFlexSize = 1;
  var isLargeScreen = false;

  List<Installation> listInstallation = List<Installation>();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  @override
  void initState() {
    super.initState();
    _fillList();
  }

  // Installation GraphQL Query
  void _fillList() async {
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
                result.data["installations"][i]["picture"]["url"]),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: OrientationBuilder(builder: (context, orientation) {
        // Desktop Size
        if (MediaQuery.of(context).size.width > 1200) {
          secondFlexSize = 3;
          isLargeScreen = true;
        // Tablet Size
        } else if (MediaQuery.of(context).size.width > 600) {
          secondFlexSize = 1;
          isLargeScreen = true;
        // Phone Size
        } else {
          isLargeScreen = false;
        }
        return Row(children: <Widget>[
          Expanded(
              flex: secondFlexSize,
              child: Column(children: <Widget>[
                Header(
                  image: "assets/icons/asoBg.svg",
                  textTop: "ARTSIDEOUT",
                  textBottom: "2020",
                  subtitle: "Event Guide",
                  offset: 0,
                ),
               Expanded(child: ListView.builder(
                  // Let the ListView know how many items it needs to build.
                  itemCount: listInstallation.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    final item = listInstallation[index];
                    return Center(
                      child: ArtListCard(
                          title: item.title,
                          image: item.imgUrl,
                          pageButton: Row(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  if (isLargeScreen) {
                                    selectedValue = index;
                                    setState(() {});
                                  } else {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) {
                                        return ArtDetailPage(item.title);
                                      },
                                    ));
                                  }
                                },
                                child: Container(
                                  width: 101,
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  alignment: Alignment.center,
                                  child: Text("View"),
                                ),
                              ),
                            ],
                          )),
                    );
                  },
                )),
              ])),
          // If large screen, render installation detail page
          (isLargeScreen && listInstallation.length != 0)
              ? Expanded(
                  child: ArtDetailWidget(listInstallation[selectedValue].title))
              : Container(),
        ]);
      }),
    );
  }
}
