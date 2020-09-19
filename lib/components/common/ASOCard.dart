import 'package:artsideout_app/models/ASOCardInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:artsideout_app/components/common/PlatformSvg.dart';

class ASOCard extends StatefulWidget {
  final ASOCardInfo asoCardInfo;
  final Function onTabTapped;
  final int index;
  final bool isBigCard;

  ASOCard(this.asoCardInfo, this.onTabTapped, this.index, this.isBigCard);

  @override
  _ASOCardState createState() => _ASOCardState();
}

class _ASOCardState extends State<ASOCard> {
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          setState(() {
            widget.onTabTapped(widget.index);
          });
        },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              color: widget.asoCardInfo.color,
              child: Stack(
                children: <Widget>[
                  PlatformSvg.asset(
                    widget.asoCardInfo.imgUrl,
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                  new Align(
                      alignment: Alignment(-0.8, 0.8),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                            widget.asoCardInfo.title,
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                .copyWith(shadows: [
                              Shadow(
                                  // bottomLeft
                                  offset: Offset(-1.0, -1.0),
                                  color: Colors.white),
                              Shadow(
                                  // bottomRight
                                  offset: Offset(1.0, -1.0),
                                  color: Colors.white),
                              Shadow(
                                  // topRight
                                  offset: Offset(1.0, 1.0),
                                  color: Colors.white),
                              Shadow(
                                  // topLeft
                                  offset: Offset(-1.0, 1.0),
                                  color: Colors.white),
                            ], color: Colors.black87)),
                      )),
                ],
              ),
            )));
  }
}
