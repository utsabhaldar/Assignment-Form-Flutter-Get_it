import 'package:assignment_form/manager/form_manager.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<FormManager>(() => FormManager());
}
