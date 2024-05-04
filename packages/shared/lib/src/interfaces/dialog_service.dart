import '../../shared.dart';

abstract class DialogService {
  Future<void> showAppDialog(DialogModel model);
  Future<void> showErrorMessage(String error);
}
