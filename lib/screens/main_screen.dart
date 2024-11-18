import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_color_provider.dart';
import '../providers/theme_font_provider.dart';
import 'settings_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeColorProvider = Provider.of<ThemeColorProvider>(context);
    final themeFontProvider = Provider.of<ThemeFontProvider>(context);
    final currentFontStyle = themeFontProvider.selectedFontStyle;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Main Screen",
          style: currentFontStyle.copyWith(
            fontSize: 24,
            color: themeColorProvider.selectedTheme.themeData.primaryColor,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to MainScreen",
                style: currentFontStyle.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color:
                      themeColorProvider.selectedTheme.themeData.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                "Enardo Stefanus - 535230072",
                style: currentFontStyle.copyWith(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color:
                      themeColorProvider.selectedTheme.themeData.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/harold.jpeg'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Go to Settings",
                  style: currentFontStyle.copyWith(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Card with shadow and rounded corners
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Your Quick Information",
                        style: currentFontStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: themeColorProvider
                              .selectedTheme.themeData.primaryColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "This is a themed card with some sample text. You can add more content here.",
                        style: currentFontStyle.copyWith(
                          fontSize: 16,
                          color: themeColorProvider
                              .selectedTheme.themeData.primaryColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Explore the app and enjoy your experience!",
                style: currentFontStyle.copyWith(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color:
                      themeColorProvider.selectedTheme.themeData.primaryColor,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
