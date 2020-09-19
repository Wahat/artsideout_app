class ActivityQueries {
  String getAll = """ 
    {
      activities {
        id
        title
        desc
        zone
        image {
          url
        }
        startTime
        endTime
        location {
          latitude
          longitude
        }
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
      activity(where: {id: ${id}}) {
        id
        title
        desc
        zone
        image {
          url
        }
        startTime
        endTime
        location {
          latitude
          longitude
        }
        locationroom
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
