import 'package:flutter/material.dart';
import 'package:artsideout_app/components/common.dart';

class Header extends StatefulWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final String subtitle;
  final double offset;
  const Header(
      {Key key,
      this.image,
      this.textTop,
      this.textBottom,
      this.subtitle,
      this.offset})
      : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Column(
          children: <Widget>[
            Positioned(
              top: (widget.offset < 0) ? 0 : widget.offset,
              child: PlatformSvg.asset(
                widget.image,
                width: 300,
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
              ),
            ),
            Positioned(
              top: 20 - widget.offset / 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("${widget.textTop} \n${widget.textBottom}",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white)),
                  Text(widget.subtitle,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.white))
                ],
              ),
            ),
          ],

              );
  }
}
