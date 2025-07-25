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
      data['teacher_id'] = user.id;

      print('REQUEST PRINT (with teacher_id): $data');

      // INSERT ke classroom dan ambil classroom_id-nya
      final insertedClassroom = await supabase
          .from('classroom')
          .insert(data)
          .select()
          .single();

      final classroomId = insertedClassroom['id'];
      if (classroomId == null) {
        throw Exception('Classroom ID not returned.');
      }

      print('CLASSROOM INSERTED: $insertedClassroom');

      print('CLASSROOM ID PRINT: $classroomId');
      print('USER ID PRINT: ${user.id}');

      // INSERT ke pivot table classroom_user
      await supabase.from('users_classroom').insert({
        'classroom_id': classroomId,
        'user_id': user.id,
      });

      print('Pivot insert success');

    } on PostgrestException catch (e) {
      throw Exception('Supabase error: ${e.message}');
    } on AuthException catch (e) {
      throw Exception('Auth error: ${e.message}');
    } catch (e, s) {
      print('ERROR: $e\nSTACKTRACE: $s');
      throw Exception('Failed to add classroom or pivot: $e');
    }
  }

}
