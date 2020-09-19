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
