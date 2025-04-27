// lib/main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/project_screen.dart';
import 'screens/create_prompter_screen.dart';
import 'screens/prompter_reader_screen.dart';
import 'screens/settings_screen.dart';
import 'screens/overlay_reader_screen.dart';
import 'providers/project_provider.dart';
import 'providers/prompter_provider.dart';
import 'models/prompter_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProjectProvider()),
        ChangeNotifierProvider(create: (_) => PrompterProvider()),
      ],
      child: PandaPromptApp(),
    ),
  );
}

class PandaPromptApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = context.watch<ProjectProvider>().isDarkMode;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PandaPrompt',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        brightness: dark ? Brightness.dark : Brightness.light,
        scaffoldBackgroundColor: dark ? Colors.black : Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: dark ? Colors.grey[800] : Colors.grey[200],
          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => SplashScreen(),
        '/home': (_) => HomeScreen(),
        '/projects': (_) => ProjectScreen(),
        '/createPrompter': (_) => CreatePrompterScreen(),
        '/settings': (_) => SettingsScreen(),
        '/overlayReader': (_) => const OverlayReaderScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/prompterReader') {
          final args = settings.arguments;
          if (args is PrompterModel) {
            return MaterialPageRoute(
              builder: (_) => PrompterReaderScreen(prompter: args),
            );
          }
          // Optionnel : route vers une page d'erreur si args n'est pas du bon type
          return MaterialPageRoute(
            builder: (_) => const Scaffold(
              body:
                  Center(child: Text('Argument invalide pour PrompterReader')),
            ),
          );
        }
        return null;
      },
    );
  }
}
