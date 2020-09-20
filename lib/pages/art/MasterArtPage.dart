import 'package:artsideout_app/constants/ColorConstants.dart';
import 'package:artsideout_app/constants/PlaceholderConstants.dart';
import 'package:artsideout_app/models/Installation.dart';
import 'package:artsideout_app/models/Profile.dart';
import 'package:artsideout_app/serviceLocator.dart';
import 'package:artsideout_app/services/GraphQLConfiguration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// GraphQL
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:artsideout_app/services/GraphQLConfiguration.dart';
import 'package:artsideout_app/graphql/InstallationQueries.dart';
// Common
import 'package:artsideout_app/components/common/PageHeader.dart';
import 'package:artsideout_app/components/art/ArtListCard.dart';
import 'package:artsideout_app/components/common/PlatformSvg.dart';
// Art
import 'package:artsideout_app/components/art/ArtDetailWidget.dart';
import 'package:artsideout_app/pages/activity/MasterActivityPage.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class MasterArtPage extends StatefulWidget {
  @override
  _MasterArtPageState createState() => _MasterArtPageState();
}

class _MasterArtPageState extends State<MasterArtPage> {
  int selectedValue = 0;
  int secondFlexSize = 1;
  int numCards = 2;
  var isLargeScreen = false;
  var isMediumScreen = false;

  List<Installation> listInstallation = List<Installation>();
  GraphQLConfiguration graphQLConfiguration =
      serviceLocator<GraphQLConfiguration>();

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
        List<Profile> profilesList = [];

        if (result.data["installations"][i]["profile"] != null) {
          for (var j = 0;
          j < result.data["installations"][i]["profile"].length;
          j++) {
            Map<String, String> socialMap = new Map();
            for (var key
            in result.data["installations"][i]["profile"][j]["social"].keys) {
              socialMap[key] =
              result.data["installations"][i]["profile"][j]["social"][key];
            }
            profilesList.add(Profile(
                result.data["installations"][i]["profile"][j]["name"],
                result.data["installations"][i]["profile"][j]["desc"],
                social: socialMap,
                type: result.data["installations"][i]["profile"][j]["type"] ?? "",
                installations: [],
                activities: []));
          }
        }
        setState(() {
          listInstallation.add(
            Installation(
              id: result.data["installations"][i]["id"],
              title: result.data["installations"][i]["title"],
              desc: result.data["installations"][i]["desc"],
              zone: result.data["installations"][i]["zone"] ?? "",
              imgURL: result.data["installations"][i]["image"] == null
                  ?  PlaceholderConstants.genericImage
                  : result.data["installations"][i]["image"]["url"],
              videoURL: result.data["installations"][i]["videoUrl"] ?? "",
              location: {
                'latitude': result.data["installations"][i]["location"] == null
                    ? 0.0
                    : result.data["installations"][i]["location"]["latitude"],
                'longitude': result.data["installations"][i]["location"] == null
                    ? 0.0
                    : result.data["installations"][i]["location"]["longitude"],
              },
              locationRoom: result.data["installations"][i]["locationroom"] ?? "",
              profiles: profilesList,
            ),
          );
        });
      }
    }
  }

  final List<ListActions> listActions = [
    ListActions("Featured", Color(0xFF62BAA6),
        "assets/icons/aboutConnections.svg", 300, MasterArtPage()),
    ListActions("Activities", Color(0xFFC155A5), "assets/icons/activities.svg",
        300, MasterActivityPage()),
    ListActions("Saved", Color(0xFF9CC9F5), "assets/icons/saved.svg", 300,
        MasterArtPage())
  ];

  @override
  Widget build(BuildContext context) {
    Widget artPageHeader = Container(
      color: Color(0xFFF9EBEB),
      padding: EdgeInsets.only(left: 12.0),
      child: PageHeader(
        textTop: "INSTALLATIONS",
        subtitle: "Connections",
      ),
    );
    return Scaffold(
      backgroundColor: ColorConstants.previewScreen,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        // Desktop Size
        if (MediaQuery.of(context).size.width > 1200) {
          secondFlexSize = 6;
          isLargeScreen = true;
          numCards = 3;
          // Tablet Size
        } else if (MediaQuery.of(context).size.width > 600) {
          secondFlexSize = 5;
          isLargeScreen = false;
          isMediumScreen = true;
          numCards = MediaQuery.of(context).orientation == Orientation.portrait
              ? 2
              : 3;
          // Phone Size
        } else {
          isLargeScreen = false;
          isMediumScreen = false;
          numCards = 2;
        }
        return Row(
          children: <Widget>[
            Expanded(
              flex: secondFlexSize,
              child: Stack(children: [
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    (isLargeScreen)
                        ? Expanded(
                            flex: 4,
                            child: Container(
                              width: 325,
                              color: Colors.transparent,
                              child: Container(
                                child: StaggeredGridView.countBuilder(
                                  padding: EdgeInsets.zero,
                                  crossAxisCount: 1,
                                  itemCount: listActions.length,
                                  itemBuilder: (BuildContext context,
                                          int index) =>
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 0, 10, 0),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: Container(
                                                  color:
                                                      listActions[index].color,
                                                  child: Stack(
                                                    children: <Widget>[
                                                      Positioned(
                                                        top: -20,
                                                        left: 10,
                                                        child:
                                                            PlatformSvg.asset(
                                                          listActions[index]
                                                              .imgUrl,
                                                          width:
                                                              listActions[index]
                                                                  .imgWidth,
                                                          fit: BoxFit.fitWidth,
                                                          alignment: Alignment
                                                              .topCenter,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment: Alignment(
                                                            -0.8, 0.8),
                                                        child: Text(
                                                            listActions[index]
                                                                .title,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headline5
                                                                .copyWith(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white)),
                                                      ),
                                                    ],
                                                  )))),
                                  staggeredTileBuilder: (int index) =>
                                      new StaggeredTile.count(
                                    1,
                                    0.57,
                                  ),
                                  mainAxisSpacing: 15.0,
                                  crossAxisSpacing: 5.0,
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        width: 500,
                        color: Colors.transparent,
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: numCards,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          // Let the ListView know how many items it needs to build.
                          itemCount: listInstallation.length,
                          // Provide a builder function. This is where the magic happens.
                          // Convert each item into a widget based on the type of item it is.
                          itemBuilder: (context, index) {
                            final item = listInstallation[index];
                            return Center(
                              child: GestureDetector(
                                child: ArtListCard(
                                  title: item.title,
                                  artist: item.zone,
                                  image: item.videoURL.isEmpty
                                      ? item.imgURL
                                      : getThumbnail(item.videoURL),
                                ),
                                onTap: () {
                                  if (isLargeScreen) {
                                    setState(() {
                                      selectedValue = index;
                                    });
                                  } else {
                                    Navigator.pushNamed(
                                      context,
                                      "/arts?id=${item.id}",
                                      arguments: item.id,
                                    );
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ]),
            ),

            // If large screen, render installation detail page
            ((isLargeScreen || isMediumScreen) && listInstallation.length != 0)
                ? Expanded(
                    flex: 3,
                    key: UniqueKey(),
                    child:
                        ArtDetailWidget(data: listInstallation[selectedValue]))
                : Container(),
          ],
        );
      }),
    );
  }

  String getThumbnail(String videoURL) {
    return YoutubePlayerController.getThumbnail(
        videoId: YoutubePlayerController.convertUrlToId(videoURL));
  }
}

class ListActions {
  String title;
  Color color;
  String imgUrl;
  double imgWidth;
  Widget page;

  ListActions(this.title, this.color, this.imgUrl, this.imgWidth, this.page);
}
