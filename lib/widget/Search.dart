//import 'dart:html';

//import 'dart:js';

import 'package:flutter/material.dart';

class Search extends SearchDelegate<String> {
  Search({required this.city});
  
  List<String> city;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = ''; 
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
      return IconButton(
        onPressed: (){
          Navigator.pop(context);
        }, 
        icon: Icon(Icons.arrow_back),
        );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<String> result = city.where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, index){
        return ListTile(
          title: Text(result[index]),
        );
      }
      );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<String> result = city.where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();

    return ListView.builder(
      itemCount: result.length,
      itemBuilder: (BuildContext context, index){
        return ListTile(
          title: Text(result[index]),
          onTap: (){
            print(result[index]);
          },
        );
      }
    );
  }
}
