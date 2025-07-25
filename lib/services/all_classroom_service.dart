import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/classroom_model.dart';

class AllClassroomService {
  final supabase = Supabase.instance.client;

  Future<List<ClassroomModel>> getAllPublicClassrooms() async {
    try {
      final userId = Supabase.instance.client.auth.currentUser?.id;
      if (userId == null) throw Exception("User belum login.");

      final response = await supabase
          .from('classroom')
          .select('*, grade(name), users(full_name)')
          .eq('is_private', false);
          // .textSearch('name', query);

      print('PRINT: $response');
      if (response.isEmpty) {
        throw Exception('No data received from Supabase.');
      }

      return response.map((item) => ClassroomModel.fromMap(item)).toList();
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
