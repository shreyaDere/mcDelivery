// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../ui/views/dashboard_view/dashboard_screen_view.dart';
import '../../ui/views/my_mcd_view/my_mcd_view.dart';
import '../../ui/views/search_view/search_screen_view.dart';
import '../../ui/views/splash_screen/splash_screen_view.dart';

class Routes {
  static const String splashScreenView = '/';
  static const String dashboardView = '/dashboard-view';
  static const String myMcdView = '/my-mcd-view';
  static const String searchView = '/search-view';
  static const all = <String>{
    splashScreenView,
    dashboardView,
    myMcdView,
    searchView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashScreenView, page: SplashScreenView),
    RouteDef(Routes.dashboardView, page: DashboardView),
    RouteDef(Routes.myMcdView, page: MyMcdView),
    RouteDef(Routes.searchView, page: SearchView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashScreenView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashScreenView(),
        settings: data,
      );
    },
    DashboardView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const DashboardView(),
        settings: data,
      );
    },
    MyMcdView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const MyMcdView(),
        settings: data,
      );
    },
    SearchView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SearchView(),
        settings: data,
      );
    },
  };
}
