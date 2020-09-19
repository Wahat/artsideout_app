import 'package:artsideout_app/components/common/ASOCard.dart';
import 'package:artsideout_app/components/common/PageHeader.dart';
import 'package:artsideout_app/models/ASOCardInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/cupertino.dart';

// TODO remove hard coded values
class HomeDetailWidget extends StatefulWidget {
  HomeDetailWidget(this.isMediumScreen, this.isLargeScreen,
      this.listHomeActions, this.onTabTapped);

  final bool isMediumScreen;
  final bool isLargeScreen;
  final List<ASOCardInfo> listHomeActions;
  final Function onTabTapped;

  @override
  _HomeDetailWidgetState createState() => _HomeDetailWidgetState();
}

class _HomeDetailWidgetState extends State<HomeDetailWidget> {
  Widget artPageHeader = PageHeader(
    textTop: "ARTSIDEOUT 2020",
    subtitle: "CONNECTIONS",
  );
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Stack(
              fit: StackFit.passthrough,
              overflow: Overflow.clip,
              children: <Widget>[
                Positioned(
                    top: 0,
                    right: 0,
                    left: 0,
                    bottom: MediaQuery.of(context).size.height / 3,
                    child: artPageHeader),
                Positioned(
                  top: MediaQuery.of(context).size.height / 10,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: StaggeredGridView.countBuilder(
                    padding: EdgeInsets.only(top: 70),
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 5.0,
                    crossAxisCount: 4, //listHomeActions.length,
                    itemCount: widget.listHomeActions.length,
                    itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ASOCard(widget.listHomeActions[index], widget.onTabTapped, index, false)),
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(
                      widget.isMediumScreen
                          ? getItemWidthTablet(index)
                          : getItemWidthPC(index),
                      widget.isMediumScreen
                          ? getItemHeightTablet(index)
                          : getItemHeightPC(index),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 3,
              child: Center(
                child: Container(
                  child: Text("Hello Bye"),
                ),
              )),
        ],
      ),
    );
  }
}

double getItemHeightPC(index) {
  if (index == 0 || index == 1) {
    //height
    return 1;
  } else if (index == 4) {
    return 1.4;
  } else
    return index.isOdd ? 0.7 : 0.7;
}

int getItemWidthPC(index) {
  if (index == 0 || index == 1) {
    return 2;
  } else if (index == 4) {
    return 2;
  } else {
    return index.isOdd ? 1 : 1;
  }
}

int getItemWidthTablet(index) {
  if (index == 0 || index == 1) {
    return 4;
  } else if (index == 2 || index == 3 || index == 5 || index == 6) {
    return 2;
  } else {
    return 4;
  }
}

int getItemHeightTablet(index) {
  if (index == 0 || index == 1) {
    return 1;
  } else if (index == 2 || index == 3 || index == 5 || index == 6) {
    return 2;
  } else {
    return 2;
  }
}
