class ProfileQueries {
  String getAll = """
    {
      profiles {
        name
        desc
        social
        type
      }
    }
  """;
  String getOneByID(String id) {
    return """
    {
      profile (where: {id: $id}) {
          id
          name
          desc
          social 
          type
        }
    }
    """;
  }
}
