import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hogr/route_manager/route.dart';

import '../controllers/restuarant_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final RestaurantController restaurantController = Get.find();
  late TabController _tabController;

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

    _tabController.index = int.parse(initialTabIndex);
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text('RESTUARANTS',
                  style:
                      TextStyle(fontSize: 20, color: const Color(0xff87559E)))),
          automaticallyImplyLeading: false,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: TabBar(
            controller: _tabController,
            labelColor: const Color(0xff87559E),
            indicatorColor: const Color(0xff87559E),
            tabs: [
              Tab(
                text: 'Restuarants',
              ),
              Tab(text: 'Contact Info'),
            ],
          ),
        ),
        body: GetBuilder<RestaurantController>(
            init: RestaurantController(),
            builder: (controller) {
              return TabBarView(
                controller: _tabController,
                children: [
                  // Tab 1: List
                  ListView.builder(
                    itemCount: restaurantController.restaurants.length,
                    itemBuilder: (context, index) {
                      final restaurant =
                          restaurantController.restaurants[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Get.toNamed(Routes.getScreen2(),
                                arguments: restaurant);
                          },
                          child: Card(
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    restaurant.name!,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),

                  // Tab 2: Contact Info
                  controller.hasAccessedContactInfo
                      ? Center(
                          child: Container(
                            height: 100,
                            margin: EdgeInsets.all(8.0),
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Contact Information',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Phone Number: ${Get.parameters['phoneNumber'] ?? ''}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Center(
                          child: Text(
                              'Please access contact info from Tab 1 first.',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                        )
                ],
              );
            }),
      ),
    );
  }
}
