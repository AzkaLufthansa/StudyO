import 'dart:convert';
import 'package:deepseek/deepseek.dart';
import 'package:study_o/models/flashcard_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FlashcardService {
  final deepSeek = DeepSeek(
    "sk-ce3e166ec998461d86d98a0b72f599e7",
  );

  Future<List<Map<String, String>>> generateFlashcard(String title, String description, String materialId) async {
    try {
      final prompt = '''
You are an assistant that generates educational flashcards.

Based on the following material provided by the user, generate five flashcards. Each flashcard should contain a clear question and a concise answer derived from the content.

Material:
"""
TITLE: $title

DESCRIPTION: $description
"""

Return the flashcards in valid JSON format using this structure:

{
  "flashcards": [
    {
      "front": "Your question here",
      "back": "Your answer here"
    },
    ...
    // total of 5 flashcards
  ]
}

Do not include any explanation or commentary outside the JSON. Focus on clarity, relevance, and accuracy.
''';

      Completion response = await deepSeek.createChat(
        messages: [Message(role: "user", content: prompt)],
        model: Models.chat.name,
        options: {
          "temperature": 1.0,
          "max_tokens": 4096,
        },
      );

      final content = response.text;

      final cleanedContent = response.text
        .replaceAll(RegExp(r'```json'), '')
        .replaceAll(RegExp(r'```'), '')
        .trim();

      print('CONTENT PRINT: $cleanedContent');

      // Parse JSON
      final Map<String, dynamic> jsonData = jsonDecode(cleanedContent);
      final List<dynamic> rawFlashcards = jsonData['flashcards'];

      // Pastikan semua item berupa Map<String, String>
      final List<Map<String, String>> flashcards = rawFlashcards.map<Map<String, String>>((item) {
        return {
          'front': item['front'].toString(),
          'back': item['back'].toString(),
        };
      }).toList();

      final supabase = Supabase.instance.client;

      print('Material ID PRINT: $materialId');

      for (final card in flashcards) {
        await supabase.from('flashcard').insert({
          'front': card['front'],
          'back': card['back'],
          // 'material_id': materialId
          // Tambahkan material_id kalau perlu relasi
          // 'material_id': yourMaterialId
        });
      }


      return flashcards;

    } catch (e, s) {
      print('ERROR: $e\n$s');
      throw Exception('Failed to generate flashcards: $e');
    }
  }

  Future<List<FlashcardModel>> getAllFlashcards() async {
    try {
      final supabase = Supabase.instance.client;

      final response = await supabase
          .from('flashcard')
          .select()
          // .eq('material_id', materialId)
          .order('created_at', ascending: true); // opsional, sort dari awal

      final flashcards = (response).map((item) {
        return FlashcardModel.fromMap(item);
      }).toList();

      return flashcards;
    } catch (e) {
      throw Exception('Failed to fetch flashcards: $e');
    }
  }
}
