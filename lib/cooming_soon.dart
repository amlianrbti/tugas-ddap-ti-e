import 'package:flutter/material.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      backgroundColor: const Color(0xFFF3EAE0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.coffee_rounded,
                size: isMobile ? 72 : 110,
                color: const Color(0xFF000000),
              ),
              SizedBox(height: isMobile ? 24 : 36),
              Text(
                'COMING SOON',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Brewed Coffee',
                  fontSize: isMobile ? 34 : 64,
                  color: const Color(0xFF000000),
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: isMobile ? 12 : 20),
              Text(
                'Halaman ini sedang diseduh ☕',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Hanuman',
                  fontSize: isMobile ? 14 : 20,
                  height: 1.6,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: isMobile ? 32 : 48),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF382219),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 16,
                  ),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  'KEMBALI',
                  style: TextStyle(
                    fontFamily: 'Hanuman',
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    fontSize: isMobile ? 12 : 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}