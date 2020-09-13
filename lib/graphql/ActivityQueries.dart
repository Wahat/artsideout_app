import 'package:artsideout_app/graphql/ProfileQueries.dart';

class ActivityQueries {
  String getAll = """ 
    {
      activities {
        title
        desc
        zone
        image {
          url
        }
        startTime
        endTime
        location {
          latitude
          longitude
        }
        profile {
          name
          desc
          social
          type
        }
      }
    }
  """;
  String getOneByID(String id) {
    return """
    {
      activity(where: {id: $id}) {
        title
        desc
        overview
        zone
        image {
          url
        }
        startTime
        endTime
        location {
          latitude
          longitude
        }
        locationroom
        profile {
          name
          desc
          social
          type
        }
      }
    }
  """;
  }
}
