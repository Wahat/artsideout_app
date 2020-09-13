import 'Activity.dart';
import 'Installation.dart';

class Profile {
  String name;
  String desc;
  Map<String, String> social;
  String type;
  List<Installation> installations;
  List<Activity> activities;

  Profile(this.name, this.desc,
      {this.social, this.type, this.installations, this.activities});
}
