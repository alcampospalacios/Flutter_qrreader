import 'package:flutter/material.dart';

class SelectedIndexProvider extends ChangeNotifier {
  int _index = 0;

  int get index {
    return this._index;
  }

  set index(int i) {
    this._index = i;
    notifyListeners();
  }
}
