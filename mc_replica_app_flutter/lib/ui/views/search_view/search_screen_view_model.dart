import 'package:mc_replica_app_flutter/app/locator/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SearchViewModel extends BaseViewModel {
  String _searchString = "what would you like to have today";
  String get searchString => _searchString;

  NavigationService _navigationService = locator<NavigationService>();

  loadData() async {}

  void searchStringValue(String value) {}

  onBackPress() {
    _navigationService.popRepeated(1);
  }
}
