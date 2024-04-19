import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'create_reel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final Brightness brightness = MediaQuery.of(context).platformBrightness;
    final bool isDarkMode = brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(),
        child: MaterialApp(
          // theme: isDarkMode ? ThemeData.dark(useMaterial3: true, ) : ThemeData.light(useMaterial3: true),
          theme: isDarkMode
              ? ThemeData.dark().copyWith(
                  textTheme: GoogleFonts.nunitoSansTextTheme().apply(bodyColor: Colors.white),)
              : ThemeData.light().copyWith(textTheme: GoogleFonts.nunitoSansTextTheme().apply(),),

          debugShowCheckedModeBanner: false,
          title: 'My App',
          home: const CreateReel(),
        ));
  }
}
