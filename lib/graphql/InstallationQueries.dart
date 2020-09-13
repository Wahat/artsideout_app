class InstallationQueries {
  String getAll = """ 
    {
      installations {
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
      Installation(where: {id: $id}) {
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
  }
}
