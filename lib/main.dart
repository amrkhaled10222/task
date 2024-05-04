//flutter packages pub run build_runner build --delete-conflicting-outputs
import 'package:Task/core/app/app_manager.dart';
import 'package:Task/core/app/app_manager_env.dart';

void main() async {
  AppManager.instance.init(AppManagerEnv.dev);
  AppManager.instance.run();
}
