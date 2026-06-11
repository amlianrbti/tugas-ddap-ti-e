import 'package:flutter/material.dart';
import '../../core/language_controller.dart';

class HeroSection extends StatelessWidget {
  final bool isMobile;
  const HeroSection({
    super.key,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMobile ? 320 : 600,
      decoration: const BoxDecoration(
        color: Color(0xFFF3EAE0),
        image: DecorationImage(
          image: AssetImage('assets/images/hero_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withValues(alpha: 0.4),
              Colors.transparent,
              Colors.black.withValues(alpha: 0.1),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Berangan • Berkarya • Bertumbuh'.tr,
              style: TextStyle(
                fontFamily: 'Hanuman',
                color: Colors.black,
                fontSize: isMobile ? 13 : 22,
                fontWeight: FontWeight.w500,
                letterSpacing: isMobile ? 1.0 : 2.0,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'BERSAMA TUKU'.tr,
              style: TextStyle(
                fontFamily: 'BrewedCoffee',
                color: const Color(0xFF000000),
                fontSize: isMobile ? 38 : 84,
                letterSpacing: 1.5,
                height: 1.1,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}