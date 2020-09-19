import 'package:artsideout_app/graphql/Profile.dart';

class Installation {
  String id;
  String title;
  String desc;
  String zone;
  String imgURL;
  String videoURL;
  Map<String, double> location;
  String locationRoom;
  List<Profile> profiles;

  Installation({this.id, this.title, this.desc,
      this.zone,
      this.imgURL,
      this.videoURL,
      this.location,
      this.locationRoom,
      this.profiles});
}

class InstallationQueries {
  String getAll = """ 
    {
      installations {
        id
        title
        desc
        zone
        videoUrl
        image {
          url
        }
        location {
          latitude
          longitude
        }
        locationRoom
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
      installation (where: {id: "$id"}) {
        id
        title
        desc
        zone
        videoUrl
        image {
          url
        }
        location {
          latitude
          longitude
        }
        locationRoom
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
