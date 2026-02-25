import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pal_marketplace/pages/start/screen/login_page.dart';

void main() {
  runApp(const MyApp());
}

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.white,
  primary: Color(0xFFFF5722),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData().copyWith(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFFCFCFC)),
        scaffoldBackgroundColor: const Color(0xFFFCFCFC),
        colorScheme: kColorScheme,
        textTheme: const TextTheme().copyWith(
          displayLarge: GoogleFonts.montserrat(
            fontSize: 19,
            color: Colors.black,
          ),
          labelLarge: GoogleFonts.montserrat(fontSize: 20, color: Colors.black),
          displayMedium: GoogleFonts.montserrat(
            fontSize: 15,
            color: Colors.black,
          ),
          labelSmall: GoogleFonts.montserrat(fontSize: 13, color: Colors.black),
          displaySmall: GoogleFonts.montserrat(
            fontSize: 11,
            color: Colors.black,
          ),
          labelMedium: GoogleFonts.montserrat(
            fontSize: 17,
            color: Colors.black,
          ),
          titleSmall: GoogleFonts.montserrat(fontSize: 8, color: Colors.black),
        ),
      ),
      home: LoginPage(),
    );
  }
}
