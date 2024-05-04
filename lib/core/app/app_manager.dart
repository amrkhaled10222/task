import 'dart:async';
import 'dart:developer';

import 'package:Task/my_app.dart';

import '../di/di.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app_manager_env.dart';

class AppManager {
  AppManager._();

  static final instance = AppManager._();

  var _env = AppManagerEnv.dev;

  AppManagerEnv get env => _env;

  bool get isAqa => _env == AppManagerEnv.testing;

  bool get isDev => _env == AppManagerEnv.dev;

  // ignore: use_setters_to_change_properties
  void init(AppManagerEnv env) {
    _env = env;
  }

  void run() {
    runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();
        // await Firebase.initializeApp();
        await configureDependencies(_env.dependencyInjectionEnv);
        runApp(MyApp());
      },
      (error, stackTrace) {
        log(error.toString());
      },
    );
  }
}
