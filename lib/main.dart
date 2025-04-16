import 'package:flutter/material.dart';
import './data/notifiers.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/loading_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedThemeNotifier,
      builder: (context, value, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Instafood',
          themeMode: value ? ThemeMode.dark : ThemeMode.light,
          theme: ThemeData.light().copyWith(
            textTheme: GoogleFonts.poppinsTextTheme(),
            colorScheme: ColorScheme.light(
              primary: Colors.green.shade700,
              secondary: Colors.white,
              surface: Colors.white,
              error: Colors.red,
              onPrimary: Colors.white,
              onSecondary: Colors.grey.shade800,
              onSurface: Colors.grey.shade800,
              onError: Colors.white,
              brightness: Brightness.light,
            )
          ),
          darkTheme: ThemeData.dark().copyWith(
            textTheme: GoogleFonts.poppinsTextTheme(),
            colorScheme: ColorScheme.dark(
              primary: Colors.green.shade700,
              secondary: Colors.white,
              surface: Colors.grey.shade900,
              error: Colors.red,
              onPrimary: Colors.white,
              onSecondary: Colors.white,
              onSurface: Colors.white,
              onError: Colors.white,
              brightness: Brightness.dark,
            )
          ),
          home: const LoadingPage(),
        );
      },
    );
  }
}
