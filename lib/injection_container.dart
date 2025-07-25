import 'package:get_it/get_it.dart';
import 'package:study_o/cubit/add_classroom/add_classroom_cubit.dart';
import 'package:study_o/cubit/classroom/classroom_cubit.dart';
import 'package:study_o/cubit/flashcard/flashcard_cubit.dart';
import 'package:study_o/cubit/get_flashcard/get_flashcard_cubit.dart';
import 'package:study_o/cubit/material/material_cubit.dart';
import 'package:study_o/services/add_classroom_service.dart';
import 'package:study_o/services/auth_service.dart';
import 'package:study_o/services/classroom_service.dart';
import 'package:study_o/services/material_service.dart';

import 'cubit/all_classroom/all_classroom_cubit.dart';
import 'cubit/auth/auth_cubit.dart';
import 'cubit/classroom_user/classroom_user_cubit.dart';
import 'cubit/post_material/post_material_cubit.dart';
import 'services/flashcard_service.dart';
import 'services/all_classroom_service.dart';

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
    () => AllClassroomCubit(
      allClassroomService: sl(),
    ),
  );
  sl.registerFactory(
    () => MaterialCubit(
      MaterialService: sl(),
    ),
  );
  sl.registerFactory(
    () => ClassroomUserCubit(
      classroomService: sl(),
    ),
  );
  sl.registerFactory(
    () => PostMaterialCubit(
      materialService: sl(),
    ),
  );
  sl.registerFactory(
    () => FlashcardCubit(
      flashcardService: sl(),
    ),
  );
  sl.registerFactory(
    () => FlashcardListCubit(
      service: sl(),
    ),
  );
  sl.registerFactory(
    () => AddClassroomCubit(
      service: sl(),
    ),
  );

  // Services
  sl.registerLazySingleton(() => AuthService());
  sl.registerLazySingleton(() => ClassroomService());
  sl.registerLazySingleton(() => MaterialService());
  sl.registerLazySingleton(() => FlashcardService());
  sl.registerLazySingleton(() => AllClassroomService());
  sl.registerLazySingleton(() => AddClassroomService());
}