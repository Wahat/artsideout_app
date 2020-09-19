import 'package:artsideout_app/components/common/PageHeader.dart';
import 'package:artsideout_app/components/common/PlatformSvg.dart';
import 'package:artsideout_app/models/ASOCardInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:artsideout_app/theme.dart';
// Home
import 'package:artsideout_app/components/home/HomeDetailWidget.dart';
// Pages
import 'package:artsideout_app/pages/art/MasterArtPage.dart';
import 'package:artsideout_app/pages/activity/MasterActivityPage.dart';
import 'package:artsideout_app/components/common/Sidebar.dart';

const int HOMEPAGE_INDEX = 10;
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedValue = HOMEPAGE_INDEX;
  int secondFlexSize = 1;
  bool isLargeScreen = false;
  bool isMediumScreen = false; // tablet

  @override
  void initState() {
    super.initState();
  }

  final List<ASOCardInfo> listHomeActions = [
    ASOCardInfo("About Connections", Color(0xFF62BAA6),
        "assets/home/about.png", 350, MasterActivityPage()),
    ASOCardInfo("Event Information", asoPrimary, "assets/home/event.png", 300,
        MasterActivityPage()),
    ASOCardInfo("News", Colors.purple[200], "assets/home/news.png", 300,
        MasterArtPage()),
    ASOCardInfo("Studio\nInstallations", Colors.blue[200], "assets/home/installations.png", 200,
        MasterArtPage()),
    ASOCardInfo("Schedule", Colors.yellow[200], "assets/home/schedule.png",
        300, MasterActivityPage()),
    ASOCardInfo("Performances", Colors.yellow[200], "assets/home/performances.png",
        300, MasterActivityPage()),
    ASOCardInfo("Saved", Colors.orange[200], "assets/icons/saved.svg", 200,
        MasterArtPage())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (MediaQuery.of(context).size.width > 1200) {
            secondFlexSize = 6;
            isLargeScreen = true;
            isMediumScreen = false;
          } else if (MediaQuery.of(context).size.width > 600) {
            secondFlexSize = 5;
            isLargeScreen = true;
            isMediumScreen = true;
          } else {
            isLargeScreen = false;
            isMediumScreen = false;
          }
          return Row(children: <Widget>[
            (isLargeScreen) ? Sidebar(onTabTapped) : Container(),
            (isLargeScreen)
                ? Expanded(
                    flex: secondFlexSize,
                    child: _selectedValue != HOMEPAGE_INDEX
                        ? listHomeActions[_selectedValue].page
                        : HomeDetailWidget(isMediumScreen, isLargeScreen,
                            listHomeActions, onTabTapped),
                  )
                : Expanded(
                    flex: 1,
                    child: Stack(
                      fit: StackFit.passthrough,
                      overflow: Overflow.clip,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Positioned(
                          top: MediaQuery.of(context).size.height / 5.3,
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: StaggeredGridView.countBuilder(
                            // padding: EdgeInsets.zero,
                            crossAxisCount: 2,
                            itemCount: listHomeActions.length,
                            itemBuilder: (BuildContext context, int index) =>
                                Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            onTabTapped(index);
                                          });
                                         Navigator.push(context,
                                             CupertinoPageRoute(
                                           builder: (context) {
                                             return listHomeActions[index]
                                                 .page;
                                           },
                                         ));
                                        },
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            child: Container(
                                              color:
                                                  listHomeActions[index].color,
                                              child: Stack(
                                                children: <Widget>[
                                                  Positioned(
                                                    top: -20,
                                                    left: 10,
                                                    child: PlatformSvg.asset(
                                                      listHomeActions[index]
                                                          .imgUrl,
                                                      width:
                                                          listHomeActions[index]
                                                              .imgWidth,
                                                      fit: BoxFit.fitWidth,
                                                      alignment:
                                                          Alignment.topCenter,
                                                    ),
                                                  ),
                                                  new Align(
                                                    alignment:
                                                        Alignment(-0.8, 0.8),
                                                    child: new Text(
                                                        listHomeActions[index]
                                                            .title,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .headline5
                                                            .copyWith(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: index ==
                                                                            0 ||
                                                                        index ==
                                                                            1
                                                                    ? Colors
                                                                        .white
                                                                    : Colors
                                                                        .black)),
                                                  ),
                                                ],
                                              ),
                                            )))),
                            staggeredTileBuilder: (int index) =>
                                new StaggeredTile.count(
                              getItemWidth(index),
                              getItemHeight(index),
                            ),
                            mainAxisSpacing: 15.0,
                            crossAxisSpacing: 5.0,
                          ),
                        ),
                      ],
                    ),
                  ),
          ]);
        },
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedValue = index;
    });
  }
}

double getItemHeight(index) {
  if (index == 0 || index == 1) //height
    return 0.6;
  else if (index == 4) {
    return 1.0;
  } else
    return 0.9;
}

int getItemWidth(index) {
  if (index == 0 || index == 1 || index == 4) {
    return 2;
  } else {
    return 1;
  }
}


