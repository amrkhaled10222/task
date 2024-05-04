import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../app/index.dart';

@module
abstract class RegisterModule {
  @Named("BaseUrl")
  String get baseUrl => AppManager.instance.env.baseUrl;

  @lazySingleton
  GlobalKey<NavigatorState> get navigator => GlobalKey<NavigatorState>();
}
