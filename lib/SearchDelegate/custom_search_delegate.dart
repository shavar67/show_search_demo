import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../services/request_movie.dart';
// ** This is where we implement the show search Delegate,
// *! This class will handle everything from searching a query,
// *! returning the results and displaying search suggestions.

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<String> movies = [];
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
    return FutureBuilder(
        future: searchMovies(query),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var result = snapshot.data[index];
                  return ExpansionTile(
                    children: [ListTile(title: Text(result.year))],
                    title: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage('${result.poster}'),
                      ),
                      title: Text(result.title),
                      onTap: () {},
                    ),
                  );
                });
          }
          if (snapshot.hasError) {
            return const Center(
                child: Text('something went wrong try searching again'));
          }
          return const Center(child: CupertinoActivityIndicator());
        });
  }

  // ** Here we will show a list of suggestions
  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: searchMovies(query),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  var result = snapshot.data[index];
                  return ExpansionTile(
                    children: [ListTile(title: Text(result.year))],
                    title: ListTile(
                      leading: CircleAvatar(
                          backgroundImage: NetworkImage('${result.poster}')),
                      title: Text(result.title),
                      onTap: () {},
                    ),
                  );
                });
          }
          if (snapshot.hasError) {
            return const Center(
                child: Text('something went wrong try searching again.'));
          }
          return const Center(child: CupertinoActivityIndicator());
        });
  }
}
