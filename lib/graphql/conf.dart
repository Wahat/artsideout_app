import "package:flutter/material.dart";
import "package:graphql_flutter/graphql_flutter.dart";

final HttpLink httpLink = HttpLink(
  uri: "https://api-us-east-1.graphcms.com/v2/ck9dc9cs915kr01xp5cb28nnr/master",
);

// final AuthLink authLink = AuthLink(
//   getToken: () async => 'Bearer Eo9ZoWWJOxZYRXnjvgkRAwzrlwG9fNXIo6po6cTaE3I',
//   // OR
//   // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
// );

//final Link link = authLink.concat(httpLink);

class GraphQLConfiguration {

  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      link: httpLink,
    );
  }
}