import 'package:flutter/material.dart';

class TypeProvider extends ChangeNotifier {
  String typeSelected = "All";
  String pageurl = 'posters/';
  List<String> allText = [];
  void toggle(String typeText) {
    typeSelected = typeText;
    notifyListeners();
  }

  void setPageUrl(String typeText) {
    switch (typeText) {
      case "Movies":
        pageurl = 'genre/movies/';
        break;
      case "All":
        pageurl = 'posters/';
        break;
      case "Tv shows":
        pageurl = 'genre/tv-shows/';
        break;
      case "Video games":
        pageurl = 'genre/video-games/';
        break;
      case "Comics":
        pageurl = 'genre/comics/';
        break;
      case "Music":
        pageurl = 'genre/music/';
        break;
      case "Staff picks":
        pageurl = 'genre/staffpicks/';
        break;
      default:
        pageurl = 'posters/';
        break;
    }
    notifyListeners();
  }

  void reload() {
    notifyListeners();
  }
}
