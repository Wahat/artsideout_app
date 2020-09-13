import 'package:artsideout_app/models/Profile.dart';

class Activity {
  String title;
  String desc;
  String zone;
  String imgUrl;
  Map<String, String> time;
  Map<String, double> location;
  List<Profile> profiles;

  Activity(this.title, this.desc, this.zone, {this.imgUrl, this.time,
    this.location, this.profiles});
}