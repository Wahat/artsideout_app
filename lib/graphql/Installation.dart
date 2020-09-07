import 'package:artsideout_app/graphql/Profile.dart';

class Installation {
  String id;
  String title;
  String desc;
  String zone;
  String imgUrl;
  Map<String, double> location;
  // String locationRoom;
  List<Object> profiles;

  Installation(
      {this.id,
      this.title,
      this.desc,
      this.zone,
      this.imgUrl,
      this.location,
      // this.locationRoom,
      this.profiles});

  // factory Installation.fromJson(Map<String, dynamic> json) {
  //   return Installation(
  //     id: json["id"],
  //     title: json["title"],
  //     desc: json["desc"],
  //     zone: json["zone"],
  //     imgUrl: json["image"]["url"],
  //     location: json["location"],
  //     // locationRoom: json["locationRoom"],
  //     profiles: json["profile"],
  //   );
  // }
}

class InstallationQueries {
  String getAll = """ 
    {
      installations {
        id
        title
        desc
        zone
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
    image {
      url
    }
    location {
      latitude
      longitude
    }
    profile 
    {name
    desc
    social
    type
    }
  }
}
  """;
  }
}
