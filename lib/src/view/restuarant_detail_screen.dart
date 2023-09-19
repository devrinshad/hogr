import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hogr/route_manager/route.dart';
import 'package:hogr/src/controllers/restuarant_controller.dart';

import '../model/restaurant.dart';


class RestuarantDetailScreen extends StatelessWidget {
  const RestuarantDetailScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final Restaurants selectedRestaurant = Get.arguments as Restaurants;

    return Scaffold(
      appBar: AppBar(title: Text(selectedRestaurant.name!), leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Get.offAndToNamed(Routes.getScreen1(),
              parameters: {'phoneNumber': selectedRestaurant.phoneNumber!,'initialTab': "0"});
        },
      ),),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cuisine: ${selectedRestaurant.cuisine!}'),
            Text('Price: ${selectedRestaurant.price}'),
            Text('Rating: ${selectedRestaurant.rating.toString()}'),
            Text('Address: ${selectedRestaurant.location!.address!.toString()}'),
            ElevatedButton(
              onPressed: () {
                print("ph0 ${selectedRestaurant.phoneNumber.toString()}");
                Get.toNamed(Routes.getScreen3(), arguments: selectedRestaurant.phoneNumber.toString());

                Get.find<RestaurantController>().setAccessedContactInfo(); // Trigger the function


              },
              child: Text('Contact Info'),
            ),
          ],
        ),
      ),
    );
  }
}
