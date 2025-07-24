import 'package:get_it/get_it.dart';
import 'package:study_o/services/auth_service.dart';

import 'cubit/auth/auth_cubit.dart';

var sl = GetIt.instance;

Future<void> initLocator() async {
  sl.allowReassignment = true;

  // Cubit
  sl.registerFactory(
    () => AuthCubit(
      authService: sl(),
    ),
  );

  // Services
  sl.registerLazySingleton(() => AuthService());
}