import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final isTablet = width >= 600 && width < 1024;

    return SizedBox(
      height: isMobile ? 340 : isTablet ? 520 : 500,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/hero-desktop.png',
              fit: BoxFit.cover,
              alignment: isMobile
                  ? const Alignment(-1, 0)
                  : isTablet
                      ? const Alignment(-0.55, 0)
                      : const Alignment(-0.45, 0),
            ),
          ),
          Positioned(
            right: -5,
            bottom: 0,
            child: Image.asset(
              'assets/images/ojol.png',
              width: isMobile
                  ? width * 0.48
                  : isTablet
                      ? 260
                      : 280,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: IgnorePointer(
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color(0xFFF3E9D7),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}