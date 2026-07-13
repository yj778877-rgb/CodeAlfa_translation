
## CodeAlpha_Translation_Tool

**Translation Tool** is a real-time language translation app built with Flutter, developed as part of my **CodeAlpha Flutter Development Internship**.

It translates text between multiple languages instantly, with text-to-speech playback and a clean, premium wine-and-cream themed interface.

## ✨ Features

- **Real-time text translation** between multiple languages
- **Text-to-speech playback** using flutter_tts — hear the translated text spoken aloud
- **Language swap** — instantly flip source and target languages
- **Copy to clipboard** for translated text
- **Custom-built UI** — premium wine and Dutch White themed design with custom typography
- **Character counter** with a 10,000 character limit

## 🛠️ Tech Stack
```bash
| Layer            | Technology                    |
|------------------|-------------------------------|
| Framework        | Flutter                       |
| State Management | Provider                      |
| Translation API  | MyMemory Translation API      |
| Text-to-Speech   | flutter_tts                   |
| HTTP Client      | http                          |
```

## ⚙️ How It Works

1. User enters text and selects source and target languages
2. On tapping Translate, the app sends a request to the MyMemory Translation API
3. The translated text is returned and displayed in the output box
4. Users can copy the translation or have it read aloud via text-to-speech
5. The swap button instantly flips source and target languages along with their text

## 🚀 Setup & Installation

**1. Clone the repository**
```bash
git clone https://github.com/wanaveshree8922-del/CodeAlpha_Translation_Tool.git
cd CodeAlpha_Translation_Tool
```

**2. Install dependencies**
```bash
flutter pub get
```

**3. Run the app**
```bash
flutter run
```

## 📁 Project Structure

```
CodeAlpha_Translation_Tool/
├── assets/
│   |── fonts/                          # Custom fonts (Agraham, Bezoria, Orvelia) 
│   └──images/                          
│       ├──app_icone.png                # App launcher icon
│       └──splash.png                   # Native splash
├── lib/
│   ├── main.dart                       # App entry point
│   ├── translate_screen.dart           # Main UI screen
│   ├── translation_provider.dart       # State management
│   └── translation_service.dart        # Translation API logic
└── pubspec.yaml
```

## 🔮 Future Improvements

- Add translation history
- Support offline translation for common phrases
- Add more language pairs
- Voice input for source text

## 🙏 Acknowledgements

Built using [MyMemory Translation API](https://mymemory.translated.net/) and [flutter_tts](https://pub.dev/packages/flutter_tts), as part of the **CodeAlpha Flutter Development Internship**.

## Author: Shreyas
