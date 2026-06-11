import 'package:flutter/material.dart';
import '../../utils/surat_kabar_constants.dart';
import '../../core/language_controller.dart';

class QuoteDivider extends StatelessWidget {
  final bool isDesktop;

  const QuoteDivider({
    super.key,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    if (!isDesktop) {
      return Text(
        "\"Lahir karena mimpi, besar karena tetangga.\"".tr,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'Hanuman',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontStyle: FontStyle.italic,
          color: SuratKabarConstants.black,
        ),
      );
    }

    return Row(
      children: [
        const Expanded(
          flex: 5,
          child: Divider(
            thickness: 1,
            color: Colors.black26,
          ),
        ),
        const SizedBox(
          width: 40,
          child: Divider(
            thickness: 1,
            color: Colors.black26,
          ),
        ),
        Expanded(
          flex: 6,
          child: Row(
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
                  "Lahir karena mimpi, besar karena tetangga.".tr,
                  style: const TextStyle(
                    fontFamily: 'Hanuman',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic,
                    color: SuratKabarConstants.black,
                  ),
                ),
              ),
              const Expanded(
                child: Divider(
                  thickness: 1,
                  color: Colors.black26,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}