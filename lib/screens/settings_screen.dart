import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_color_provider.dart';
import '../providers/theme_font_provider.dart';
import '../models/theme_model.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeColorProvider = Provider.of<ThemeColorProvider>(context);
    final themeFontProvider = Provider.of<ThemeFontProvider>(context);
    final currentFontStyle = themeFontProvider.selectedFontStyle;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: currentFontStyle.copyWith(
            fontSize: 24,
            color: themeColorProvider.selectedTheme.themeData.primaryColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Customize Your Theme",
              style: currentFontStyle.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: themeColorProvider.selectedTheme.themeData.primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            // Theme Color Selector
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  "Select Color Theme",
                  style: currentFontStyle.copyWith(
                    fontSize: 18,
                    color:
                        themeColorProvider.selectedTheme.themeData.primaryColor,
                  ),
                ),
                subtitle: Text(
                  themeColorProvider.selectedTheme.name,
                  style: currentFontStyle.copyWith(
                    color:
                        themeColorProvider.selectedTheme.themeData.primaryColor,
                  ),
                ),
                trailing: const Icon(Icons.color_lens),
                onTap: () {
                  _showColorThemeDialog(context, themeColorProvider);
                },
              ),
            ),
            const SizedBox(height: 20),
            // Font Style Selector
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                title: Text(
                  "Select Font Style",
                  style: currentFontStyle.copyWith(
                    fontSize: 18,
                    color:
                        themeColorProvider.selectedTheme.themeData.primaryColor,
                  ),
                ),
                subtitle: Text(
                  themeFontProvider.selectedFontStyle.fontFamily ?? "",
                  style: currentFontStyle.copyWith(
                    color:
                        themeColorProvider.selectedTheme.themeData.primaryColor,
                  ),
                ),
                trailing: const Icon(Icons.text_fields),
                onTap: () {
                  _showFontStyleDialog(context, themeFontProvider);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showColorThemeDialog(
      BuildContext context, ThemeColorProvider themeColorProvider) {
    final currentFontStyle = themeColorProvider.selectedTheme.fontStyle;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Choose a Color Theme",
            style: currentFontStyle.copyWith(fontSize: 20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: themes.map((theme) {
              return ListTile(
                title: Text(
                  theme.name,
                  style: theme.fontStyle,
                ),
                leading: CircleAvatar(
                  backgroundColor: theme.themeData.primaryColor,
                ),
                onTap: () {
                  themeColorProvider.setTheme(theme);
                  Navigator.pop(context); // Close dialog
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }

  void _showFontStyleDialog(
      BuildContext context, ThemeFontProvider themeFontProvider) {
    final currentFontStyle = themeFontProvider.selectedFontStyle;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Choose a Font Style",
            style: currentFontStyle.copyWith(fontSize: 20),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: themes.map((theme) {
              return ListTile(
                title: Text(
                  theme.fontStyle.fontFamily ?? "",
                  style: theme.fontStyle,
                ),
                onTap: () {
                  themeFontProvider.setFontStyle(theme.fontStyle);
                  Navigator.pop(context); // Close dialog
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
