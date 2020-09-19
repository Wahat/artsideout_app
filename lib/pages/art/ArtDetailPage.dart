import 'package:flutter/material.dart';
import 'package:artsideout_app/components/art/ArtDetailWidget.dart';
import 'package:artsideout_app/graphql/Installation.dart';
import 'package:artsideout_app/theme.dart';

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
// GraphQL
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:artsideout_app/graphql/config.dart';

class ArtDetailPage extends StatefulWidget {
  // Old
  // final Installation data;
  // ArtDetailPage(this.data);

  // New
  final String artPageId;
  ArtDetailPage(this.artPageId);

  @override
  _ArtDetailPageState createState() => _ArtDetailPageState();
}

class _ArtDetailPageState extends State<ArtDetailPage> {
  // Future<Installation> futureArtDetails;
  Installation artDetails;

  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

  @override
  void initState() {
    super.initState();
    //  this._getArtPost(widget.artPageId);

    _getArtPost(widget.artPageId);
  }

  // Installation GraphQL Query
  _getArtPost(pageId) async {
    InstallationQueries queryInstallation = InstallationQueries();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryInstallation.getOneByID(pageId)),
      ),
    );
    if (!result.hasException) {
      print("from ARTDETAILPAGE: ${result.data["installation"]["title"]}");
      setState(() {
        artDetails = Installation(
          id: result.data["installation"]["id"],
          title: result.data["installation"]["title"] == null
              ? "N/A"
              : result.data["installation"]["title"],
          desc: result.data["installation"]["desc"] == null
              ? "N/A"
              : result.data["installation"]["desc"],
          zone: result.data["installation"]["zone"] == null
              ? "N/A"
              : result.data["installation"]["zone"],
          videoURL: result.data["installation"]["videoUrl"] == null
              ? "empty"
              : result.data["installation"]["videoUrl"],
          imgURL: result.data["installation"]["image"] == null
              ? 'https://via.placeholder.com/350'
              : result.data["installation"]["image"]["url"],
          location: {
            'latitude': result.data["installation"]["location"] == null
                ? 0.0
                : result.data["installation"]["location"]["latitude"],
            'longitude': result.data["installation"]["location"] == null
                ? 0.0
                : result.data["installation"]["location"]["longitude"],
          },
          // locationRoom: result.data["installation"]["locationroom"],
          profiles: [],
        );
      });
    } else {
      print("CANNOT GET ART DETAILS");
    }
    // return artDetails;
  }

  // Future<Installation> _getArtPost(String pageId) async {
  //   print("GETARTPOST: ${pageId}");
  //   InstallationQueries queryInstallation = InstallationQueries();
  //   GraphQLClient _client = graphQLConfiguration.clientToQuery();
  //   QueryResult result = await _client.query(
  //     QueryOptions(
  //       documentNode: gql(queryInstallation.getOneByID(pageId)),
  //     ),
  //   );
  //   if (!result.hasException) {
  //     print(result.data["installation"].runtimeType);
  //     return Installation.fromJson(json.decode((result.data["installation"])));
  //   } else {
  //     print("problem: ${result.exception.toString()}");
  //     print("From GraphQL: ${result.data}");
  //     throw Exception("Failed to load art");
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: asoPrimary,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Color(0x00000000),
        elevation: 0.0,
//        backgroundColor: Colors.white,
//        title: Text(
//          widget.data.title,
//          style: TextStyle(color: asoPrimary),
//        ),
      ),
    body: ArtDetailWidget(data: artDetails));
  }
}
