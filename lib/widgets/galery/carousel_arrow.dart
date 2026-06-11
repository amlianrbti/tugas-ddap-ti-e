import 'package:flutter/material.dart';

class CarouselArrow extends StatelessWidget {
  final IconData icon;
  final bool isMobile;
  final VoidCallback onPressed;

  const CarouselArrow({
    super.key,
    required this.icon,
    required this.isMobile,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: const Color(0xFF000000),
        size: isMobile ? 18 : 28,
      ),
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(
        minWidth: isMobile ? 24 : 48,
        minHeight: isMobile ? 24 : 48,
      ),
      onPressed: onPressed,
    );
  }
}