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
          imgUrl: result.data["installation"]["image"] == null
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
          profiles: result.data["installation"]["profile"],
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
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          // title: Text(
          //   artDetails.title,
          //   style: TextStyle(color: asoPrimary),
          // ),
        ),
        body: ArtDetailWidget(artDetails));
    // body: Center(
    //     child: FutureBuilder<Installation>(
    //         future: futureArtDetails,
    //         builder: (context, AsyncSnapshot<Installation> snapshot) {
    //           // snapshot is the installation from the query
    //           if (snapshot.hasData) {
    //             return ArtDetailWidget(snapshot.data);
    //           } else if (snapshot.hasError) {
    //             print(snapshot);
    //             return Text("${snapshot.error}");
    //           }
    //           return Text("test123");
    //         })))
  }
}
