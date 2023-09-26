import 'package:flutter/material.dart';

class TypeProvider extends ChangeNotifier {
  String typeSelected = "All";
  final pageurl = '/posters/';
  void toggle(String typeText) {
    typeSelected = typeText;
    notifyListeners();
  }

  void setPageUrl(String typeText) {
    switch (typeText) {
      case "Movies":
        'genre/movies/';
        break;
      default:
    }
  }
}
