import 'package:flutter/material.dart';
// ** This is where we implement the show search Delegate,
// *! This class will handle everything from searching a query,
// *! returning the results and displaying search suggestions.

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<String> fruits = [
    'Apples',
    'Bananas',
    'Strawberries',
    'Watermelon',
    'Grapes'
  ];
  // *! This section is to clear the query
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  // ** This makes sure we can close and leave the search bar
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  // *! This method will display the search results
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in fruits) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () {},
          );
        });
  }

  // ** Here we will show a list of suggestions
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in fruits) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () {},
          );
        });
  }
}
