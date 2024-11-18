import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/theme_color_provider.dart';
import 'providers/theme_font_provider.dart';
import 'screens/main_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeColorProvider()),
        ChangeNotifierProvider(create: (_) => ThemeFontProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeColorProvider, ThemeFontProvider>(
      builder: (context, themeColorProvider, themeFontProvider, child) {
        return MaterialApp(
          theme: themeColorProvider.selectedTheme.themeData.copyWith(
            textTheme: TextTheme(
              bodyLarge: themeFontProvider.selectedFontStyle.copyWith(
                color: themeColorProvider.selectedTheme.themeData.primaryColor,
              ),
              bodyMedium: themeFontProvider.selectedFontStyle.copyWith(
                color: themeColorProvider.selectedTheme.themeData.primaryColor,
              ),
            ),
          ),
          home: const MainScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
