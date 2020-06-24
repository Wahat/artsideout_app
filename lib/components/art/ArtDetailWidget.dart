import 'package:artsideout_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:artsideout_app/graphql/Installation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ArtDetailWidget extends StatefulWidget {
  final Installation data;

  ArtDetailWidget(this.data);

  @override
  _ArtDetailWidgetState createState() => _ArtDetailWidgetState();
}

class _ArtDetailWidgetState extends State<ArtDetailWidget> {
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.data.imgUrl),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.pink,
              radius: 25.0,
            ),
            title: Text(
              'John Appleseed',
              style: GoogleFonts.quicksand(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: 16.0,
              ),
            ),
            trailing: IconButton(
              icon: Icon(FontAwesomeIcons.solidBookmark),
              color: asoPrimary,
              onPressed: () {},
            ),
          ),
          ListTile(
            leading: Text(
              widget.data.zone,
              style: TextStyle(
                color: asoPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 1.0,
            height: 0,
            indent: 15,
            endIndent: 20,
          ),
          ListTile(
            leading: Text(
              'OVERVIEW',
              style: TextStyle(
                color: asoPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 16.0,
                ),
                Flexible(
                  child: Text(widget.data.desc),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
