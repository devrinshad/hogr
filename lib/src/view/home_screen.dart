import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hogr/route_manager/route.dart';

import '../controllers/restuarant_controller.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>with SingleTickerProviderStateMixin {
  final RestaurantController restaurantController = Get.find();
  late TabController _tabController ;

  bool hasAccessedContactInfo = false;
  String initialTabIndex = "0";
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        hasAccessedContactInfo = true;

      }
    });
  }


  @override
  Widget build(BuildContext context) {
    initialTabIndex = Get.parameters['initialTab'] ?? "0";
    print("----   ${Get.parameters['initialTab']}");
    _tabController.index = int.parse(initialTabIndex);
    return WillPopScope(
      onWillPop: () async {

        return false;
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Restaurants'),
          automaticallyImplyLeading: false,

        ),
        bottomNavigationBar: TabBar(
          controller: _tabController,
          labelColor: Colors.blue,
          tabs: [
            Tab(text: 'List',),
            Tab(text: 'Contact Info'),
          ],
          indicatorColor: Colors.blue, // Customize indicator color if needed
        ),

        body:  GetBuilder<RestaurantController>(
            init: RestaurantController(),
            builder: (controller) {
              return TabBarView(
                controller: _tabController,
                children: [
                  // Tab 1: List
                  ListView.builder(
                    itemCount: restaurantController.restaurants.length,
                    itemBuilder: (context, index) {
                      final restaurant = restaurantController.restaurants[index];
                      return ListTile(
                        title: Text(restaurant.name!),
                        onTap: () {
                          // Navigate to Screen2 when a list item is tapped
                          Get.toNamed(Routes.getScreen2(), arguments: restaurant);
                          // Get.to(Screen2(restaurant: restaurant, onContactInfoAccessed: () {
                          //   setState(() {
                          //     hasAccessedContactInfo = true;
                          //   });
                          // }));
                        },
                      );
                    },
                  ),

                  // Tab 2: Contact Info
                  controller.hasAccessedContactInfo
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Contact Information'),
                        // Display contact information here
                        Text('Phone Number: ${Get.parameters['phoneNumber'] ?? ''}'),

                      ],
                    ),
                  )
                      : Center(
                    child: Text('Please access contact info from Tab 1 first.'),
                  )
                ],
              );
            }
        ),




      ),
    );
  }
}
