import 'package:flutter/cupertino.dart';
import 'package:mc_replica_app_flutter/app/locator/locator.dart';
import 'package:mc_replica_app_flutter/app/router/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:intl/intl.dart';
import 'package:mc_replica_app_flutter/app/logger/logger.dart';

class DashboardViewModel extends BaseViewModel {
  NavigationService _navigationService = locator<NavigationService>();
  final logger = getLogger("dashboard");
  String _userNameWithWishhing;
  int _category = 0;
  int get category => _category;
  String get userNameWithWishhing => _userNameWithWishhing;
  bool _calorieToggle = false;
  bool get calorieToggle => _calorieToggle;
  bool _vegOnlyToggle = false;
  bool get vegOnlyToggle => _vegOnlyToggle;

  getDateInterval() {
    var format = DateFormat("HH:mm");
    DateTime now = DateTime.now();
    DateTime morning = format.parse("07:00");
    morning = new DateTime(
        now.year, now.month, now.day, morning.hour, morning.minute);
    DateTime afterenoon = format.parse("12:00");
    afterenoon = new DateTime(
        now.year, now.month, now.day, afterenoon.hour, afterenoon.minute);
    DateTime evening = format.parse("16:00");
    evening = new DateTime(
        now.year, now.month, now.day, evening.hour, evening.minute);
    DateTime close = format.parse("19:00");
    close =
        new DateTime(now.year, now.month, now.day, close.hour, close.minute);
    // logger.d("${now.isBefore(evening) && now.isAfter(afterenoon)}");
    // logger.d("${now.isBefore(evening)} , $now, ${now.isAfter(morning)}");
    if (now.isAfter(morning) && now.isBefore(afterenoon)) {
      return _userNameWithWishhing = "Good Morning User Name";
    } else if (now.isAfter(afterenoon) && now.isBefore(evening)) {
      return _userNameWithWishhing = "Good Afternoon User Name";
    } else if (now.isAfter(close) && now.isBefore(morning)) {
      return _userNameWithWishhing = "Good Evening User Name";
    } else {
      return _userNameWithWishhing = "UserName";
    }
  }

  loadData() async {}

  bottomNavigation(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        _navigationService.navigateTo(Routes.searchView);
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      default:
    }
  }

  setFlagForCategory(int i) {
    _category = i;
    notifyListeners();
  }

  changeCaloriesToggel(bool value) {}

  onCalorieToggel(val) {
    _calorieToggle = val;
    notifyListeners();
  }

  onVegOnlyToggleToggel(bool val) {
    _vegOnlyToggle = val;
    notifyListeners();
  }
}
