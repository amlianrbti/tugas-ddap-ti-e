import 'package:flutter/material.dart';
import '../../utils/surat_kabar_constants.dart';

class VerticalDetailItem extends StatelessWidget {
  final String title;
  final String desc;

  const VerticalDetailItem({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'BrewedCoffee',
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: SuratKabarConstants.black,
            decoration: TextDecoration.underline,
            decorationThickness: 1.5,
          ),
        ),
        if (desc.isNotEmpty) ...[
          const SizedBox(height: 12),
          Text(
            desc,
            style: const TextStyle(
              fontFamily: 'Hanuman',
              fontSize: 14,
              height: 1.6,
              color: SuratKabarConstants.black,
            ),
          ),
        ],
      ],
    );
  }
}