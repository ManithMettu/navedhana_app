
import 'package:flutter/material.dart';


import '../models/vegetable.dart';

class VegetableProvider with ChangeNotifier {
  List<Vegetable> _vegetables = [];

  List<Vegetable> get vegetables => _vegetables;

  void fetchVegetables() async {
   // _vegetables = await ApiService().fetchVegetables();
    notifyListeners();
  }
}
