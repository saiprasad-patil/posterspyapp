import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posterspyapp/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: const Color.fromARGB(255, 32, 34, 37),
          canvasColor: const Color.fromARGB(255, 20, 21, 23),
          textTheme: TextTheme(
              labelMedium: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 135, 135, 135)),
              labelLarge: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromARGB(255, 0, 102, 255)),
              titleLarge: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 25))),
      home: const HomePage(),
    );
  }
}
