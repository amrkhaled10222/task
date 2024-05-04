import 'dart:async';
import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';
import 'package:shared/shared.dart';
import 'package:ui/ui.dart';

@LazySingleton(as: DialogService)
class DialogServiceImpl implements DialogService {
  final NavigationService _navigationService;

  DialogServiceImpl(this._navigationService);

  BuildContext get _context => _navigationService.context!;

  @override
  Future<void> showAppDialog(DialogModel model) async {
    await showDialog<void>(
      context: _context,
      builder: (_) => AppDialog(dialogModel: model),
    );
  }

  @override
  Future<void> showErrorMessage(String error) async {
    await showDialog<void>(
      context: _context,
      builder: (_) => ErrorDialog(message: error),
    );
  }
}
