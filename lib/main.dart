import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'translation_provider.dart';
import 'translate_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TranslationProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Language Translation Tool',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF5E9D7),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF722F37),
            primary: const Color(0xFF722F37),
          ),
        ),
        home: const TranslateScreen(),
      ),
    );
  }
}  