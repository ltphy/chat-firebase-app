import 'package:flutter/material.dart';

class LikeProvider extends ChangeNotifier {
  int likes;

  LikeProvider({this.likes});

  void updateLikes(int newLikes) {
    this.likes = newLikes;
    notifyListeners();
  }
}
