import 'package:flutter/material.dart';

import '../SearchDelegate/custom_search_delegate.dart';

class SearchHome extends StatefulWidget {
  const SearchHome({Key? key}) : super(key: key);

  @override
  State<SearchHome> createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Movie App'), actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search))
        ]),
        body: const Center(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text('Start searching for movies now'),
        )));
  }
}
