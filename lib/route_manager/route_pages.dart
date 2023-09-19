import 'package:get/get.dart';
import 'package:hogr/route_manager/route_names.dart';
import 'package:hogr/src/view/contact_info_screen.dart';
import 'package:hogr/src/view/restuarant_detail_screen.dart';

import '../src/view/home_screen.dart';



const duration = Duration(milliseconds: 500);
const transition = Transition.cupertino;


class RoutesPages {
  static List<GetPage> routes = [
  GetPage(
  name: RouteName.screen1Route,
  page: () =>  Home(),
  transition: transition,
  transitionDuration: duration,
  ),
    GetPage(
  name: RouteName.screen2Route,
  page: () =>  RestuarantDetailScreen(),
  transition: transition,
  transitionDuration: duration,
  ),
    GetPage(
  name: RouteName.screen3Route,
  page: () =>  ContactInfoScreen(),
  transition: transition,
  transitionDuration: duration,
  ),
  ];

}