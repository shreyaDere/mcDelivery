import 'package:auto_route/auto_route_annotations.dart';
import 'package:mc_replica_app_flutter/ui/views/dashboard_view/dashboard_screen_view.dart';
import 'package:mc_replica_app_flutter/ui/views/my_mcd_view/my_mcd_view.dart';
import 'package:mc_replica_app_flutter/ui/views/search_view/search_screen_view.dart';
import 'package:mc_replica_app_flutter/ui/views/splash_screen/splash_screen_view.dart';

@MaterialAutoRouter(routes: <AutoRoute>[
  MaterialRoute(page: SplashScreenView, initial: true),
  MaterialRoute(page: DashboardView, initial: false),
  MaterialRoute(page: MyMcdView, initial: false),
  MaterialRoute(page: SearchView, initial: false),

  // CustomRoute(
  //     page: SignUpCustomWebView,
  //     transitionsBuilder: TransitionsBuilders.slideLeft,
  //     initial: false,
  //     durationInMilliseconds: 400),
])
class $Router {}
