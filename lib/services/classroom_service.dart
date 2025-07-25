import 'package:study_o/models/material_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/classroom_model.dart';

class ClassroomService {
  final supabase = Supabase.instance.client;

  Future<List<ClassroomModel>> getAllMyClassrooms() async {
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) throw Exception("User belum login.");

      final response = await supabase
          .from('users_classroom')
          .select('classroom(id, name, grade, grade(name), teacher_id, users(full_name), is_private, password)')
          .eq('', userId);

      print('PRINT: $response');
      if (response.isEmpty) {
        throw Exception('No data received from Supabase.');
      }

      return response.map((item) => ClassroomModel.fromMap(item['classroom'])).toList();
    } on PostgrestException catch (e) {
      // Error dari query Supabase
      throw Exception('Supabase error: ${e.message}');
    } on AuthException catch (e) {
      // Kalau misalnya error otentikasi
      throw Exception('Auth error: ${e.message}');
    } catch (e, s) {
      print('ERROR: $s');
      // Error lain (misalnya null pointer, parsing, atau jaringan)
      throw Exception('Failed to fetch classrooms: $e');
    }
  }

  Future<List<MaterialModel>> getAllClassroomMaterials(String classroomId) async {
    try {
      final response = await supabase
          .from('material')
          .select('*')
          .eq('classroom_id', classroomId);

      print('PRINT: $response');
      if (response.isEmpty) {
        throw Exception('No data received from Supabase.');
      }

      return response.map((item) => MaterialModel.fromMap(item)).toList();
    } on PostgrestException catch (e) {
      // Error dari query Supabase
      throw Exception('Supabase error: ${e.message}');
    } catch (e, s) {
      print('ERROR: $s');
      // Error lain (misalnya null pointer, parsing, atau jaringan)
      throw Exception('Failed to fetch classrooms: $e');
    }
  }

  Future<List<UserJoinedModel>> getClassroomJoinedUsers(String classroomId) async {
    try {
      // final response = await supabase
      //   .from('classroom')
      //   .select('teacher_id, users_classroom(user_id, users(full_name, id, score))')
      //   .eq('id', classroomId);

      final response = await supabase
        .from('users_classroom')
        .select('classroom(teacher_id, users(full_name, id, score))')
        .eq('classroom_id', classroomId);


      print('PRINT: $response');

      List<UserJoinedModel> joinedUsers = [];

      for (final item in response) {
        final teacherId = item['teacher_id'];
        final users = item['users_classroom'] as List<dynamic>;

        for (final userMap in users) {
          joinedUsers.add(UserJoinedModel.fromMap(userMap, teacherId));
        }

      }

      print('PRINT ANJAY: $joinedUsers');

      return joinedUsers;
    } on PostgrestException catch (e) {
      // Error dari query Supabase
      throw Exception('Supabase error: ${e.message}');
    } catch (e, s) {
      print('ERROR: $s');
      // Error lain (misalnya null pointer, parsing, atau jaringan)
      throw Exception('Failed to fetch classrooms: $e');
    }
  }
}
