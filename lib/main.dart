import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hogr/route_manager/route_pages.dart';
import 'package:hogr/src/controllers/restuarant_controller.dart';

import 'route_manager/route.dart';



void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  final RestaurantController restaurantController = Get.put(RestaurantController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: RoutesPages.routes,

      initialRoute: Routes.getScreen1(),

    );

  }
}