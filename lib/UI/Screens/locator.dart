import 'package:get_it/get_it.dart';
import 'package:jobportal/core/services/auth_service.dart';
import 'package:jobportal/core/services/database_service.dart';

GetIt locator = GetIt.instance;

setupLocator() {
  // locator.registerSingleton(AuthService());
  locator.registerSingleton(DatabaseService());
  locator.registerSingleton(AuthService());
}
