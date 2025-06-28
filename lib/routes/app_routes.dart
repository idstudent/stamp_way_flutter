import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/pages/login_page.dart';
import 'package:stamp_way_flutter/pages/main_page.dart';
import 'package:stamp_way_flutter/pages/my_complete_list_page.dart';
import 'package:stamp_way_flutter/pages/my_tour_list_page.dart';
import 'package:stamp_way_flutter/pages/near_place_page.dart';
import 'package:stamp_way_flutter/pages/setting_page.dart';
import 'package:stamp_way_flutter/pages/tour_detail_page.dart';

import '../pages/my_tour_detail_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String myTourList = '/my-tour-list';
  static const String nearPlaceList = '/near-place-list';
  static const String tourDetail = '/tour-detail';
  static const String myTourDetail = '/my-tour-detail';
  static const String myCompleteList = '/my-complete-list';
  static const String login = '/login';
  static const String setting = '/setting';
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      name: AppRoutes.home,
      builder: (context, state) => MainPage()
    ),
    GoRoute(
      path: AppRoutes.nearPlaceList,
      name: AppRoutes.nearPlaceList,
      builder: (context, state)  {
        return NearPlacePage();
      } 
    ),
    GoRoute(
      path: AppRoutes.login,
      name: AppRoutes.login,
      builder: (context, state) {
        return LoginPage();
      }
    ),
    GoRoute(
      path: AppRoutes.myTourList,
      name: AppRoutes.myTourList,
      builder: (context, state) {
        return MyTourListPage();
      }
    ),
    GoRoute(
      path: AppRoutes.tourDetail,
      name: AppRoutes.tourDetail,
      builder: (context, state) {
        return TourDetailPage();
      }
    ),
    GoRoute(
        path: AppRoutes.myTourDetail,
        name: AppRoutes.myTourDetail,
        builder: (context, state) {
          return MyTourDetailPage();
        }
    ),
    GoRoute(
        path: AppRoutes.setting,
        name: AppRoutes.setting,
        builder: (context, state) {
          return SettingPage();
        }
    ),
    GoRoute(
        path: AppRoutes.myCompleteList,
        name: AppRoutes.myCompleteList,
        builder: (context, state) {
          return MyCompleteListPage();
        }
    ),
  ],
);