import 'dart:convert';
import 'package:http/http.dart' as http;

class TranslationService {
  static const String _baseUrl = 'https://api.mymemory.translated.net/get';

  Future<String> translateText({
    required String text,
    required String sourceLang,
    required String targetLang,
  }) async {
    final langPair = '$sourceLang|$targetLang';
    final uri = Uri.parse(
      '$_baseUrl?q=${Uri.encodeComponent(text)}&langpair=$langPair',
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final translated = data['responseData']?['translatedText'];

      if (translated == null || translated.toString().isEmpty) {
        throw Exception('Empty translation response');
      }

      return translated.toString();
    } else {
      throw Exception('Translation API error: ${response.statusCode}');
    }
  }
}