import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:healthkick/services/database.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  SearchScreen createState() => SearchScreen();
}

class SearchScreen extends State<Search> {
  DatabaseManager manager = new DatabaseManager();
  TextEditingController searchController = new TextEditingController();
  QuerySnapshot usersListSnapshot;

  bool isLoading = false;
  bool isSearching = false;

  initSearch() async {
    if (searchController.text.isNotEmpty) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {}

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
