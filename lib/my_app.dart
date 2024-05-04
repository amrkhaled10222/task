import 'core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _navigatorKey = getIt<GlobalKey<NavigatorState>>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: _navigatorKey,
      home: Scaffold(
        body: Center(
          child: Text("hello"),
        ),
      ),
    );
  }

  List<LocalizationsDelegate<dynamic>> _localizationsDelegates() {
    return const [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ];
  }
}
