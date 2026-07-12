import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'translation_service.dart';

class TranslationProvider extends ChangeNotifier {
  final TranslationService _service = TranslationService();
  final FlutterTts _tts = FlutterTts();

  String sourceLang = 'en';
  String sourceLangName = 'English';
  String targetLang = 'hi';
  String targetLangName = 'Hindi';

  String inputText = '';
  String translatedText = '';
  bool isLoading = false;

  static const Map<String, String> languages = {
    'en': 'English',
    'mr': 'Marathi',
    'hi': 'Hindi',
    'fr': 'French',
    'es': 'Spanish',
    'de': 'German',
    'ja': 'Japanese',
    'zh-CN': 'Chinese',
    'ar': 'Arabic',
    'ru': 'Russian',
    'pt': 'Portuguese',
    'ko': 'Korean',
  };

  void setInputText(String text) {
    inputText = text;
    notifyListeners();
  }

  void clearInput() {
    inputText = '';
    translatedText = '';
    notifyListeners();
  }

  void setSourceLang(String code) {
    sourceLang = code;
    sourceLangName = languages[code] ?? code;
    notifyListeners();
  }

  void setTargetLang(String code) {
    targetLang = code;
    targetLangName = languages[code] ?? code;
    notifyListeners();
  }

  void swapLanguages() {
    final tempCode = sourceLang;
    final tempName = sourceLangName;
    sourceLang = targetLang;
    sourceLangName = targetLangName;
    targetLang = tempCode;
    targetLangName = tempName;

    final tempText = inputText;
    inputText = translatedText;
    translatedText = tempText;

    notifyListeners();
  }

  Future<void> translate() async {
    if (inputText.trim().isEmpty) return;
    isLoading = true;
    notifyListeners();

    try {
      translatedText = await _service.translateText(
        text: inputText,
        sourceLang: sourceLang,
        targetLang: targetLang,
      );
    } catch (e) {
      translatedText = 'Translation failed. Please try again.';
    }

    isLoading = false;
    notifyListeners();
  }

  Future<void> copyToClipboard() async {
    if (translatedText.isEmpty) return;
    await Clipboard.setData(ClipboardData(text: translatedText));
  }

  Future<void> speak() async {
    if (translatedText.isEmpty) return;
    await _tts.setLanguage(targetLang);
    await _tts.speak(translatedText);
  }
}