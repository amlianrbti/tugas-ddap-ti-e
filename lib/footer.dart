import 'package:flutter/material.dart';
import '../core/language_controller.dart';

class FooterPage extends StatelessWidget {
  const FooterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF3EAE0),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3EAE0),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'INFO TUKU',
          style: TextStyle(
            fontFamily: 'Brewed Coffee',
            fontSize: isMobile ? 20 : 28,
            color: const Color(0xFF000000),
          ),
        ),
        iconTheme: const IconThemeData(
          color: Color(0xFF000000),
        ),
      ),
      body: ValueListenableBuilder<AppLanguage>(
        valueListenable: LanguageController.language,
        builder: (context, lang, child) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 60,
              vertical: isMobile ? 24 : 40,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxWidth: isMobile ? 250 : 400,
                  ),
                  child: Image.asset(
                    'assets/images/tuku_sketch.png',
                    fit: BoxFit.contain,
                  ),
                ),

                SizedBox(height: isMobile ? 24 : 40),

                Text(
                  'Terima kasih sudah menjadi bagian dari perjalanan Tuku.\n\nKami percaya bahwa kopi bukan hanya soal rasa, tetapi juga tentang hubungan, cerita, dan kebersamaan dengan tetangga sekitar.'
                      .tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Hanuman',
                    fontSize: isMobile ? 14 : 18,
                    height: 1.8,
                    color: const Color(0xFF000000),
                  ),
                ),

                SizedBox(height: isMobile ? 32 : 50),

                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'scroll_to_kegiatan');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF382219),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 28,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'KEMBALI KE GALERI'.tr,
                    style: TextStyle(
                      fontFamily: 'Hanuman',
                      fontSize: isMobile ? 12 : 14,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                ),

                SizedBox(height: isMobile ? 40 : 70),

                Text(
                  '© 2026 PT KARYA TETANGGA TUKU. ALL RIGHT RESERVED.'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Hanuman',
                    fontSize: isMobile ? 10 : 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    letterSpacing: 0.5,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}