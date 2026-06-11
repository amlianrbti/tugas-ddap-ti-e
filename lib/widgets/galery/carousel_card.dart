import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  final String title;
  final String image;
  final bool isActive;
  final double screenWidth;
  final VoidCallback onTap;

  const CarouselCard({
    super.key,
    required this.title,
    required this.image,
    required this.isActive,
    required this.screenWidth,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isMobile = screenWidth < 600;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1100;

    final double width = isMobile
        ? (isActive ? 160 : 110)
        : (isTablet
            ? (isActive ? 220 : 170)
            : (isActive ? 340 : 280));

    final double height = isMobile
        ? (isActive ? 220 : 170)
        : (isTablet
            ? (isActive ? 290 : 230)
            : (isActive ? 420 : 340));

    final double margin = isMobile ? 4 : (isTablet ? 8 : 16);
    final double padding = isMobile ? 8 : (isTablet ? 12 : 16);

    final double fontSize = isMobile
        ? (isActive ? 11 : 9)
        : (isTablet
            ? (isActive ? 14 : 12)
            : (isActive ? 18 : 15));

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(horizontal: margin),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(
                alpha: isActive ? 0.08 : 0.04,
              ),
              blurRadius: isMobile
                  ? (isActive ? 8 : 4)
                  : (isActive ? 16 : 8),
              offset: Offset(
                0,
                isMobile
                    ? (isActive ? 4 : 2)
                    : (isActive ? 8 : 4),
              ),
            ),
          ],
          border: Border.all(
            color: const Color(0xFFE5DCD0),
            width: isMobile ? 1.0 : 1.5,
          ),
        ),
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: isMobile ? 8 : 16),
            Text(
              title.toUpperCase(),
              style: TextStyle(
                fontFamily: 'Hanuman',
                fontSize: fontSize,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF000000),
                height: 1.2,
                letterSpacing: 0.5,
              ),
              textAlign: TextAlign.left,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            if (isActive && !isMobile)
              const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}