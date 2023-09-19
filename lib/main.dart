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
        primarySwatch: Colors.deepPurple,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: const Color(0xff87559E),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
            actionsIconTheme: IconThemeData(color: Colors.black),
            iconTheme: IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0.0,
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
      ),
      getPages: RoutesPages.routes,

      initialRoute: Routes.getScreen1(),

    );

  }
}