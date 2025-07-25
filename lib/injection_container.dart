import 'package:get_it/get_it.dart';
import 'package:study_o/cubit/classroom/classroom_cubit.dart';
import 'package:study_o/cubit/material/material_cubit.dart';
import 'package:study_o/services/auth_service.dart';
import 'package:study_o/services/classroom_service.dart';

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
  sl.registerFactory(
    () => ClassroomCubit(
      classroomService: sl(),
    ),
  );
  sl.registerFactory(
    () => MaterialCubit(
      MaterialService: sl(),
    ),
  );

  // Services
  sl.registerLazySingleton(() => AuthService());
  sl.registerLazySingleton(() => ClassroomService());
}