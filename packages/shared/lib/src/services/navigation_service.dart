import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class NavigationService {
  final GlobalKey<NavigatorState> _navigator;
  NavigationService(this._navigator);

  Future<dynamic> routeTo(String route, {Object? arguments}) {
    return _navigator.currentState!.pushNamed(route, arguments: arguments);
  }

  void pop<T>([T? result]) {
    return _navigator.currentState!.pop(result);
  }

  void popUntil<T>(RoutePredicate predicate) {
    return _navigator.currentState!.popUntil(predicate);
  }

  Future<dynamic> replaceRoute(String route, {Object? arguments}) {
    return _navigator.currentState!.pushReplacementNamed(route, arguments: arguments);
  }

  Future<dynamic> routeAndPopUntil(String newRouteName, RoutePredicate predicate, {Object? arguments}) {
    return _navigator.currentState!.pushNamedAndRemoveUntil(newRouteName, predicate, arguments: arguments);
  }

  BuildContext? get context => _navigator.currentContext;
}
