import 'package:go_router/go_router.dart';
import 'package:stamp_way_flutter/pages/main_page.dart';

class AppRoutes {
  static const String home = '/';
}

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: AppRoutes.home,
      name: AppRoutes.home,
      builder: (context, state) => MainPage()
    )
  ],
);