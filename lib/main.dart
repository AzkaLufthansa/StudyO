import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:study_o/cubit/auth/auth_cubit.dart';
import 'package:study_o/initialize_app.dart';
import 'package:study_o/injection_container.dart';
import 'package:study_o/routes/routes.dart';
import 'package:study_o/screens/login_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Force orientation potrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  
  await InitializeApp.init();

  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => sl<AuthCubit>()
        ),
      ],
      child: GetMaterialApp(
        title: 'StudyO',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        debugShowCheckedModeBanner: false,
        navigatorObservers: [FlutterSmartDialog.observer],
        builder: FlutterSmartDialog.init(),
        darkTheme: ThemeData(
          fontFamily: 'MiSans',
          brightness: Brightness.dark
        ),
        themeMode: ThemeMode.dark,
        
        home: LoginPage(),
        getPages: AppRoutes.pageRoute,
      ),
    );
  }
}


