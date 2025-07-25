import 'package:study_o/models/classroom_request_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AddClassroomService {
  final supabase = Supabase.instance.client;

  Future<void> postAddPrivateClassrooms(AddClassroomRequestModel request) async {
    try {
      final user = supabase.auth.currentUser;
      if (user == null) {
        throw Exception('User not logged in.');
      }

      final data = request.toJson();
      data['teacher_id'] = user.id; // 👈 tambahkan teacher_id di sini

      print('REQUEST PRINT (with teacher_id): $data');

      await supabase
          .from('classroom')
          .insert(data);
    } on PostgrestException catch (e) {
      throw Exception('Supabase error: ${e.message}');
    } on AuthException catch (e) {
      throw Exception('Auth error: ${e.message}');
    } catch (e, s) {
      print('ERROR: $e\nSTACKTRACE: $s');
      throw Exception('Failed to add classroom: $e');
    }
  }
}
