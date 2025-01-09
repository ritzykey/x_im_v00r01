import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:x_im_v00r01/feature/home/view/home_detail_view.dart';
import 'package:x_im_v00r01/feature/home/view/home_view.dart';
import 'package:x_im_v00r01/feature/login/view/login_view.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: HomeDetailRoute.page),
        AutoRoute(page: LoginRoute.page, initial: true),
      ];
}












/*     List<AutoRoute> get routes => [
        AutoRoute(
          page: HomeRoute.page,
          path: '/home',
          initial: true,
          children: [
            AutoRoute(page: HomeDetailRoute.page, path: 'detail'),
          ],
        ),

        /// routes go here
      ];   */