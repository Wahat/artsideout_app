class Installation {
  String title;
  String artist;
  String zone;
  String imgUrl;

  Installation(this.title, this.artist, this.zone, this.imgUrl);
}

class InstallationQueries {
  String getAll = """ 
    {
      installations {
        title
        artist
        zone
        picture {
          url
        }
      }
    }
  """;
}
