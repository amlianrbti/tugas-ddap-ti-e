import 'package:flutter/material.dart';
import '../../utils/surat_kabar_constants.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final TextStyle? style;

  const SectionTitle({
    super.key,
    required this.title,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 20,
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: style ??
            const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: SuratKabarConstants.black,
              letterSpacing: 2,
            ),
      ),
    );
  }
}