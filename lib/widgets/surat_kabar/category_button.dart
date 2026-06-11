import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onTap;
  final bool isDesktop;

  const CategoryButton({
    super.key,
    required this.title,
    required this.color,
    required this.onTap,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    Widget button = InkWell(
      onTap: onTap,
      child: Container(
        width: isDesktop ? null : double.infinity,
        height: isDesktop ? 70 : 55,
        color: color,
        alignment: Alignment.center,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Hanuman',
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );

    return isDesktop ? Expanded(child: button) : button;
  }
}