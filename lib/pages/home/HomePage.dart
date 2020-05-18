import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// GraphQL
import 'package:artsideout_app/graphql/config.dart';
import 'package:artsideout_app/graphql/Installation.dart';
import 'package:artsideout_app/components/common.dart';
// Home
import 'package:artsideout_app/components/home/HomeDetailWidget.dart';
import 'package:artsideout_app/components/home/HomeHeader.dart';
import 'package:artsideout_app/pages/home/HomeDetailPage.dart';
// Pages
import 'package:artsideout_app/pages/art/MasterArtPage.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedValue = 0;
  int secondFlexSize = 1;
  bool isLargeScreen = false;

  List<Installation> listInstallation = List<Installation>();
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  @override
  void initState() {
    super.initState();
  }

  final List<HomeAction> listHomeActions = [
    HomeAction("News", Colors.purple[200], "assets/icons/activities.svg", 300,
        MasterArtPage()),
    HomeAction("Art", Colors.blue[200], "assets/icons/installation.svg", 200,
        MasterArtPage()),
    HomeAction("Activities", Colors.yellow[200], "assets/icons/activities.svg",
        300, MasterArtPage()),
    HomeAction("Saved", Colors.orange[200], "assets/icons/saved.svg", 200,
        MasterArtPage())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        if (MediaQuery.of(context).size.width > 1200) {
          secondFlexSize = 3;
          isLargeScreen = true;
        } else if (MediaQuery.of(context).size.width > 600) {
          secondFlexSize = 1;
          isLargeScreen = true;
        } else {
          isLargeScreen = false;
        }
        return Row(children: <Widget>[
          (isLargeScreen)
              ? Expanded(
                  flex: secondFlexSize, child: HomeDetailWidget("Temp Event Guide Page"))
              : Container(),
          Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      if (!isLargeScreen) {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return HomeDetailPage("Temp Event Page");
                        },
                      ));
                      }
                    },
                    child: Header(
                      image: "assets/icons/asoBg.svg",
                      textTop: "ARTSIDEOUT",
                      textBottom: "2020",
                      subtitle: "Event Guide",
                      offset: 0,
                    ),
                  ),
                  Expanded(
                      child: new StaggeredGridView.countBuilder(
                    crossAxisCount: listHomeActions.length,
                    itemCount: listHomeActions.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return listHomeActions[index].page;
                                },
                              ));
                            },
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Container(
                                  color: listHomeActions[index].color,
                                  child: Stack(
                                    children: <Widget>[
                                      Positioned(
                                        top: 0,
                                        child: PlatformSvg.asset(
                                          listHomeActions[index].imgUrl,
                                          width:
                                              listHomeActions[index].imgWidth,
                                          fit: BoxFit.fitWidth,
                                          alignment: Alignment.topCenter,
                                        ),
                                      ),
                                      new Align(
                                        alignment: Alignment(-0.8, 0.8),
                                        child: new Text(
                                            listHomeActions[index].title,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                      ),
                                    ],
                                  ),
                                )))),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(2, index.isOdd ? 1.5 : 2.3),
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 5.0,
                  )),
                ],
              )),
        ]);
      }),
    );
  }
}

class HomeAction {
  String title;
  Color color;
  String imgUrl;
  double imgWidth;
  Widget page;

  HomeAction(this.title, this.color, this.imgUrl, this.imgWidth, this.page);
}
