##  Show Search Demo

    Enable searching in your app with the Search Delegate


### implementing the SearchDelegate class
      Override these 4 methods.
```dart
  CustomSearchDelegate extends SearchDelegate {
  
  // *! This section is to clear the query
  @override
  List<Widget>? buildActions(BuildContext context) {}
  
    // ** This makes sure we can close and leave the search bar
   @override
  List<Widget>? buildActions(BuildContext context) {}
  
  // *! This method will display the search results
  @override
  Widget buildResults(BuildContext context) {}

  // ** Here we will show a list of suggestions
  @override
  Widget buildSuggestions(BuildContext context) {
  }
```

#### Implementing the custom seearch delegate class  
```dart
class SearchHome extends StatefulWidget {
  const SearchHome({Key? key}) : super(key: key);

  @override
  State<SearchHome> createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('ShowSearch Demo'), actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              icon: const Icon(Icons.search))
        ]),
        body: const Center(
            child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
              'This is a showSearch demo where we will implement the showSearch delegate. '),
        )));
  }
}
 ```
 

https://user-images.githubusercontent.com/23090608/167276254-b64a0e62-b29c-43e0-b522-2d7ab4cd2c7d.mp4


 
