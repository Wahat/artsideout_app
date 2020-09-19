import 'package:artsideout_app/graphql/ActivityQueries.dart';
import 'package:artsideout_app/graphql/GraphQLConfiguration.dart';
import 'package:flutter/material.dart';
import 'package:artsideout_app/models/Activity.dart';
import 'package:artsideout_app/components/activity/ActivityDetailWidget.dart';
import 'package:artsideout_app/theme.dart';

// GraphQL
import 'package:graphql_flutter/graphql_flutter.dart';

class ActivityDetailPage extends StatefulWidget {
  // Old
  // final Activity data;
  // ActivityDetailPage(this.data);

  final String activityPageId;
  ActivityDetailPage(this.activityPageId);

  @override
  _ActivityDetailPageState createState() => _ActivityDetailPageState();
}

class _ActivityDetailPageState extends State<ActivityDetailPage> {
  Activity activityDetails;

  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  @override
  void initState() {
    super.initState();
    _getActivityPost(widget.activityPageId);
  }

  void _getActivityPost(pageId) async {
    ActivityQueries queryActivity = ActivityQueries();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        documentNode: gql(queryActivity.getOneByID(pageId)),
      ),
    );
    if (!result.hasException) {
      String imgUrlTest = (result.data["activities"]["image"] != null)
          ? result.data["activities"]["image"]["url"]
          : "https://via.placeholder.com/350";

      Map<String, double> location =
          (result.data["activity"]["location"] != null)
              ? {
                  'latitude': result.data["activity"]["location"]["latitude"],
                  'longitude': result.data["activity"]["location"]["longitude"]
                }
              : {'latitude': -1.0, 'longitude': 43.78263096464635};

      Map<String, String> time = {
        'startTime': result.data["activity"]["startTime"] ?? "",
        'endTime': result.data["activity"]["endTime"] ?? ""
      };

      setState(() {
        activityDetails = Activity(
            id: result.data["activity"]["id"],
            title: result.data["activity"]["title"],
            desc: result.data["activity"]["desc"],
            zone: result.data["activity"]["zone"],
            location: location,
            profiles: result.data["activity"]["profile"],
            imgUrl: imgUrlTest,
            time: time);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          activityDetails.title,
          style: TextStyle(
            color: asoPrimary,
          ),
        ),
      ),
      body: ActivityDetailWidget(activityDetails),
    );
  }
}
