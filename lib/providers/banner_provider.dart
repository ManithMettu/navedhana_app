
import 'package:flutter/material.dart';


import '../models/banner.dart';

class BannerProvider with ChangeNotifier {
  List<BannerModel> _banners = [];

  List<BannerModel> get banners => _banners;

  void fetchBanners() async {
    //_banners = await ApiService().fetchBanners();
    notifyListeners();
  }
}
