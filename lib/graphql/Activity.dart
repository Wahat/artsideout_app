class Activity {
  String title;
  String desc;
  String overview;
  String organizer;
  String imgUrl;

  Activity(this.title, this.desc, this.overview, this.organizer, this.imgUrl);
}

class ActivityQueries {
  String getAll = """ 
    {
      activities {
        title
        description
        overview
        organizer
        image {
          url
        }
      }
    }
  """;
}
