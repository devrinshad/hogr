import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../route_manager/route.dart';

class ContactInfoScreen extends StatelessWidget {
  const ContactInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String phoneNumber = Get.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Contact Info')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Phone Number: $phoneNumber'),
            ElevatedButton(
              onPressed: () {

                Get.offAndToNamed(Routes.getScreen1(),
                    parameters: {'phoneNumber': phoneNumber,'initialTab': "1"});



              },
              child: Text('Call'),
            ),
          ],
        ),
      ),
    );
  }
}


