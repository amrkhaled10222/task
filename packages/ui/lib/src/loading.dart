import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({this.color});
final Color? color;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color:color),
    );
  }
}
