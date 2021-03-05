import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "sailashree vihar",
    "niladri vihar",
    "vani vihar",
    "acharya vihar",
    "saheed nagar",
    "jaydev vihar",
    "nayapalli",
    "chandrasekhar pur",
    "patia",
    "rangeswar nagar",
    "master canteen",
    "budha vihar",
    "pragati vihar",
    "infocity",
    "satsang vihar",
  ];
  final recent = [
    "acharya vihar",
    "saheed nagar",
    "jaydev vihar",
    "nayapalli",
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      ),
    ];
    // action for app search bar
    // ignore: dead_code
    throw UnimplementedError();
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
    // leading icon on the left of the app bar
    // ignore: dead_code
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100,
        child: Card(
          color: Colors.red,
          child: Center(
            child: Text(query),
          ),
        ),
      ),
    );
    // show some result based on the selection
    // ignore: dead_code
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestion = query.isEmpty
        ? recent
        : cities.where((p) => p.startsWith(query)).toList();

    return cities.isEmpty
        ? Text(
            "No Result Found...",
            style: TextStyle(fontSize: 20),
          )
        : ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                showResults(context);
              },
              leading: Icon(Icons.location_city),
              title: RichText(
                text: TextSpan(
                  text: suggestion[index].substring(0, query.length),
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                      text: suggestion[index].substring(query.length),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            itemCount: suggestion.length,
          );
    // show when soeone search for something
    // ignore: dead_code
    throw UnimplementedError();
  }
}
