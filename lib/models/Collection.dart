import 'package:artsideout_app/models/Installation.dart';
import 'package:artsideout_app/models/Profile.dart';

class Collection {
  String title;
  String desc;
  Profile artist;
  List<Installation> installations;

  Collection(this.title, this.desc, this.artist, this.installations);
}
