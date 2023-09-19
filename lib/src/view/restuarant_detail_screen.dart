import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
      appBar: AppBar(
        title: Text(selectedRestaurant.name!.toUpperCase(),
            style: TextStyle(fontSize: 18, color: const Color(0xff87559E))),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: const Color(0xff87559E),
          ),
          onPressed: () {
            Get.offAndToNamed(Routes.getScreen1(), parameters: {
              'phoneNumber': selectedRestaurant.phoneNumber!,
              'initialTab': "0"
            });
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              elevation: 5,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedRestaurant.name!,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    RatingBar.builder(
                      initialRating: selectedRestaurant.rating!,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 20,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (double value) {},
                    ),
                    SizedBox(height: 8),
                    Text(
                      selectedRestaurant.cuisine!,
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      selectedRestaurant.location!.address!.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      selectedRestaurant.website!.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 8),
                    Text(
                      selectedRestaurant.hours!.open!.toString() +
                          "-" +
                          selectedRestaurant.hours!.close!.toString(),
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            InkWell(
              onTap: () {
                print("ph0 ${selectedRestaurant.phoneNumber.toString()}");
                Get.toNamed(Routes.getScreen3(),
                    arguments: selectedRestaurant.phoneNumber.toString());

                Get.find<RestaurantController>().setAccessedContactInfo();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff87559E),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Contact Info',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
