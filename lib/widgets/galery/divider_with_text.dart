import 'package:flutter/material.dart';

class DividerWithText extends StatelessWidget {
  final String text;
  final bool isMobile;

  const DividerWithText({
    super.key,
    required this.text,
    required this.isMobile,
  });

  @override
  Widget build(BuildContext context) {
    final double textPadding = isMobile ? 12 : 24;
    final double fontSize = isMobile ? 11 : 15;
    final double lineLength = isMobile ? 40 : 120;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: lineLength,
          height: 1.5,
          color: const Color(0xFFC7B8A9),
        ),
        Flexible(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: textPadding),
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Hanuman',
                fontSize: fontSize,
                fontWeight: FontWeight.w700,
                color: const Color(0xFF000000),
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          width: lineLength,
          height: 1.5,
          color: const Color(0xFFC7B8A9),
        ),
      ],
    );
  }
}