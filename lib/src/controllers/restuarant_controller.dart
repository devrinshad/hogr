import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

import '../model/restaurant.dart';

class RestaurantController extends GetxController {
  List<Restaurants> restaurants = [];
  bool hasAccessedContactInfo = false;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      final jsonString = await rootBundle.loadString('assets/data.json');
      final jsonData = json.decode(jsonString);

      if (jsonData.containsKey('restaurants')) {
        final restaurantsList = jsonData['restaurants'] as List;
        restaurants =
            restaurantsList.map((json) => Restaurants.fromJson(json)).toList();
      }
    } catch (e) {
      print('Error loading data: $e');
    }
    update();
  }

  void setAccessedContactInfo() {
    hasAccessedContactInfo = true;

    update();
  }
}
