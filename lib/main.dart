import 'package:flutter/material.dart';
import 'package:show_search_demo/pages/home_show_search.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Movie Search Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const SearchHome());
  }
}
