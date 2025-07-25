import 'package:study_o/models/post_material_request_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MaterialService {
  Future<String> postMaterial(PostMaterialRequestModel request) async {
    try {
      final supabase = Supabase.instance.client;

      final response = await supabase
        .from('material')
        .insert(request.toJson())
        .select();

      print('ANJAY PRINT: ${response.first}');

      return response.first['id'];
    } on PostgrestException catch (e) {
      // Error dari query Supabase
      throw Exception('Supabase error: ${e.message}');
    } catch (e, s) {
      print('ERROR: $s');
      // Error lain (misalnya null pointer, parsing, atau jaringan)
      throw Exception('Failed to post: $e');
    }
  }
}