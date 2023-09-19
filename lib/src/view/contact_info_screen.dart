import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../route_manager/route.dart';

class ContactInfoScreen extends StatelessWidget {
  const ContactInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String phoneNumber = Get.arguments as String;
    return Scaffold(
      appBar: AppBar(
          title: Text('CONTACT INFO',
              style: TextStyle(fontSize: 18, color: const Color(0xff87559E)))),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Phone Number:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 8,
            ),
            Text(phoneNumber,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAndToNamed(Routes.getScreen1(), parameters: {
                  'phoneNumber': phoneNumber,
                  'initialTab': "1"
                });
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xff87559E),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                child: Text('Call'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
