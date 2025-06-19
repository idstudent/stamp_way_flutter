import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/pages/login_page.dart';
import 'package:stamp_way_flutter/pages/main_page.dart';
import 'package:stamp_way_flutter/pages/near_place_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String nearPlaceList = '/near-place-list';
  static const String login = '/login';
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
    )
  ],
);