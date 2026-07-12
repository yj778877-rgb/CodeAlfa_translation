import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'translation_provider.dart';

class TranslateScreen extends StatelessWidget {
  const TranslateScreen({super.key});

  static const wine = Color(0xFF722F37);
  static const darkWine = Color(0xFF4A1E24);
  static const dutchWhite = Color(0xFFEFDFBB);
  static const softCream = Color(0xFFF7ECDA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dutchWhite,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildHeader(constraints),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 18),
                              _buildLanguageSection(context),
                              const SizedBox(height: 16),
                              const Text(
                                'ENTER TEXT',
                                style: TextStyle(
                                  fontFamily: 'Orvelia',
                                  fontSize: 12,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w600,
                                  color: wine,
                                ),
                              ),
                              const SizedBox(height: 6),
                              SizedBox(
                                height: 160,
                                child: _buildInputBox(context),
                              ),
                              const SizedBox(height: 14),
                              _buildTranslateButton(context),
                              const SizedBox(height: 14),
                              const Text(
                                'TRANSLATED TEXT',
                                style: TextStyle(
                                  fontFamily: 'Orvelia',
                                  fontSize: 12,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.w600,
                                  color: wine,
                                ),
                              ),
                              const SizedBox(height: 6),
                              SizedBox(
                                height: 160,
                                child: _buildOutputBox(context),
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.only(top: 22, left: 14, right: 14),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(34),
            bottomRight: Radius.circular(34),
            topLeft: Radius.circular(34),
            topRight: Radius.circular(34),
          ),
      
      child: Container(
        height: 180,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              dutchWhite,
              wine.withValues(alpha: 0.10),
              wine.withValues(alpha: 0.18),
              wine.withValues(alpha: 0.10),
              ],
            stops: const [0.0, 0.35, 0.7, 1.0],
          ),
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              top: -35,
              right: -25,
              child: Container(
                width: 190,
                height: 190,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      wine.withValues(alpha: 0.12),
                      wine.withValues(alpha: 0.03),
                      Colors.transparent,
                    ],
                    stops: const [0.0, 0.4, 0.82, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 25,
              child: _buildHeaderIllustration(),
            ),
            Positioned(
              left: 30,
              top: 30,
              right: 140,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Language\nTranslation Tool',
                    style: TextStyle(
                      fontFamily: 'Bezoria',
                      fontSize: 26,
                      height: 1.15,
                      color: darkWine,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(width: 14, height: 1, color: wine),
                      const SizedBox(width: 4),
                      const Text('✦', style: TextStyle(color: wine, fontSize: 10)),
                      const SizedBox(width: 4),
                      Container(width: 14, height: 1, color: wine),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Translate text between\nmultiple languages instantly.',
                    style: TextStyle(
                      fontFamily: 'Orvelia',
                      fontSize: 12.5,
                      height: 1.3,
                      color: darkWine,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    );
  }

  Widget _buildHeaderIllustration() {
    return SizedBox(
      width: 110,
      height: 110,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 10,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: wine,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: const Text(
                'A',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: 65,
              height: 65,
              decoration: BoxDecoration(
                color: softCream,
                borderRadius: BorderRadius.circular(16),
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.translate, color: wine, size: 28),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSection(BuildContext context) {
    final provider = context.watch<TranslationProvider>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: _buildDropdownColumn(
            context,
            label: 'FROM (SOURCE LANGUAGE)',
            value: provider.sourceLang,
            name: provider.sourceLangName,
            onChanged: (code) => provider.setSourceLang(code!),
          ),
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(bottom: 0),
          child: GestureDetector(
            onTap: () => provider.swapLanguages(),
            child: Container(
              width: 48,
              height: 52,
              decoration: BoxDecoration(
                color: softCream,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: wine.withValues(alpha: 0.15)),
              ),
              child: const Icon(Icons.swap_horiz, color: wine, size: 22),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildDropdownColumn(
            context,
            label: 'TO (TARGET LANGUAGE)',
            value: provider.targetLang,
            name: provider.targetLangName,
            onChanged: (code) => provider.setTargetLang(code!),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownColumn(
    BuildContext context, {
    required String label,
    required String value,
    required String name,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Orvelia',
            fontSize: 10.5,
            letterSpacing: 0.6,
            fontWeight: FontWeight.w600,
            color: wine,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          height: 52,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: softCream,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: wine.withValues(alpha: 0.15)),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down, color: wine, size: 20),
              items: TranslationProvider.languages.entries
                  .map(
                    (e) => DropdownMenuItem(
                      value: e.key,
                      child: Row(
                        children: [
                          Container(
                            width: 26,
                            height: 26,
                            decoration: const BoxDecoration(
                              color: wine,
                              shape: BoxShape.circle,
                            ),
                            alignment: Alignment.center,
                            child: const Icon(Icons.language,
                                color: Colors.white, size: 14),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              e.value,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'Orvelia',
                                fontSize: 14,
                                color: darkWine,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInputBox(BuildContext context) {
    final provider = context.watch<TranslationProvider>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
      decoration: BoxDecoration(
        color: softCream,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: wine.withValues(alpha: 0.15)),
      ),
      child: Column(
        children: [
          Expanded(
            child: TextField(
              maxLength: 10000,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              onChanged: (v) => provider.setInputText(v),
              controller: TextEditingController(text: provider.inputText)
                ..selection = TextSelection.collapsed(
                    offset: provider.inputText.length),
              style: const TextStyle(
                fontFamily: 'Orvelia',
                fontSize: 15,
                color: darkWine,
              ),
              decoration: const InputDecoration(
                hintText: 'Enter text to translate...',
                hintStyle: TextStyle(
                  fontFamily: 'Orvelia',
                  fontSize: 15,
                  color: Color(0xFFB59A8A),
                ),
                border: InputBorder.none,
                counterText: '',
                isDense: true,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                '${provider.inputText.length} / 10000',
                style: const TextStyle(
                  fontFamily: 'Orvelia',
                  fontSize: 12,
                  color: darkWine,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => provider.clearInput(),
                child: const Icon(Icons.close, color: wine, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTranslateButton(BuildContext context) {
    final provider = context.watch<TranslationProvider>();

    return GestureDetector(
      onTap: provider.isLoading ? null : () => provider.translate(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        height: 56,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [Color(0xFF5A232A), wine],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: [
            BoxShadow(
              color: wine.withValues(alpha: 0.35),
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: provider.isLoading
            ? const SizedBox(
                width: 22,
                height: 22,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.2,
                ),
              )
            : const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.translate, color: Colors.white, size: 20),
                  SizedBox(width: 10),
                  Text(
                    'TRANSLATE',
                    style: TextStyle(
                      fontFamily: 'Orvelia',
                      fontSize: 15,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildOutputBox(BuildContext context) {
    final provider = context.watch<TranslationProvider>();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 10),
      decoration: BoxDecoration(
        color: softCream,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: wine.withValues(alpha: 0.15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Text(
                provider.translatedText.isEmpty
                    ? 'Translation will appear here...'
                    : provider.translatedText,
                style: TextStyle(
                  fontFamily: 'Orvelia',
                  fontSize: 15,
                  color: provider.translatedText.isEmpty
                      ? const Color(0xFFB59A8A)
                      : darkWine,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _iconButton(Icons.volume_up, () => provider.speak()),
              const SizedBox(width: 8),
              _iconButton(Icons.copy_rounded, () => provider.copyToClipboard()),
            ],
          ),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: dutchWhite,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: wine.withValues(alpha: 0.15)),
        ),
        child: Icon(icon, color: wine, size: 20),
      ),
    );
  }
}