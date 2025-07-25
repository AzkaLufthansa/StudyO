import 'package:study_o/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'injection_container.dart' as service_locator;

class InitializeApp {
  InitializeApp._();


  static Future<void> init() async {
    await service_locator.initLocator();

    await Supabase.initialize(
      url: SUPABASE_URL,
      anonKey: SUPABASE_ANON_KEY
    );
  }

}