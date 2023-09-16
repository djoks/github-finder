import 'package:github_finder/enums/route.dart';
import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  final List<AppRoute> _pageStack = [AppRoute.home];

  AppRoute get pageName => _pageStack.last;

  void changePage(AppRoute newPage) {
    _pageStack.add(newPage);
    notifyListeners();
  }

  void goBack() {
    if (_pageStack.length > 1) {
      _pageStack.removeLast();
      notifyListeners();
    }
  }
}
