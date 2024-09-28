
import 'package:flutter/material.dart';


import '../models/leaf_vegetable.dart';

class LeafVegetableProvider with ChangeNotifier {
  List<LeafVegetable> _leafVegetables = [];

  List<LeafVegetable> get leafVegetables => _leafVegetables;

  void fetchLeafVegetables() async {
    //_leafVegetables = await ApiService().fetchLeafVegetables();
    notifyListeners();
  }
}
