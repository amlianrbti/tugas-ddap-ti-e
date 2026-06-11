import 'package:flutter/material.dart';
import 'core/language_controller.dart';
import 'pages/home_page.dart';
import 'pages/surat_kabar_page.dart';
import 'pages/galery_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: LanguageController.language,
      builder: (context, value, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          initialRoute: '/home',

          routes: {
            '/home': (context) => const HomePage(),

            '/surat-kabar': (context) =>
                const SuratKabarPage(),

            '/galeri': (context) =>
                const GalleryPage(),
          },
        );
      },
    );
  }
}