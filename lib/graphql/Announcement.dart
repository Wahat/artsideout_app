class Announcement {
  String title;
  String desc;

  Announcement(this.title, this.desc);
}

class AnnouncementQueries {
  String getAll = """ 
    {
      announcements {
        title
        desc
      }
    }
  """;
  String getOneByID(String id) {
    return """
    {
      announcement(where: {id: $id}) {
        title
        desc
      }
    }
  """;
  }
}
