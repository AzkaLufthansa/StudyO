import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/grade_model.dart';

class GradeService {
  final supabase = Supabase.instance.client;

  Future<List<GradeModel>> getAllMyGrades() async {
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) throw Exception("User belum login.");

      final response = await supabase
          .from('grades')
          .select('*');

      print('PRINT: $response');
      if (response.isEmpty) {
        throw Exception('No data received from Supabase.');
      }

      return response.map((item) => GradeModel.fromMap(item['grade'])).toList();
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
}
