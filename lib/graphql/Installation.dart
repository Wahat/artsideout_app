class Installation {
  String title;
  String artist;
  String zone;
  String pictureUrl;

  Installation(this.title, this.artist, this.zone, this.pictureUrl);
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