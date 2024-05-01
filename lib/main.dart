import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp/Theme/themes.dart';
import 'pages/home_page.dart';

const notesBox = 'NOTES_BOX';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('NOTES_BOX');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        themeMode: ThemeMode.system,
        darkTheme: darkTheme,
        home: const HomePage());
  }
}
