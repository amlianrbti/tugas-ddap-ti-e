import 'package:flutter/material.dart';
import '../../utils/surat_kabar_constants.dart';

class BottomQuote extends StatelessWidget {
  final String text;

  const BottomQuote({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    final quoteStyle = TextStyle(
      fontFamily: 'Hanuman',
      fontSize: 13,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      color: SuratKabarConstants.black,
      height: isMobile ? 1.6 : null,
    );

    if (isMobile) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: quoteStyle,
        ),
      );
    }

    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.black26,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: quoteStyle,
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1,
            color: Colors.black26,
          ),
        ),
      ],
    );
  }
}