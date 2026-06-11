import 'package:flutter/material.dart';
import '../../utils/surat_kabar_constants.dart';

class IconTextColumn extends StatelessWidget {
  final String title;
  final String desc;
  final bool isDesktop;
  final List<Widget> subFeatures;

  final TextStyle? titleStyle;
  final TextStyle? descStyle;

  final bool rightAlignText;

  const IconTextColumn({
    super.key,
    required this.title,
    required this.desc,
    required this.isDesktop,
    required this.subFeatures,
    this.titleStyle,
    this.descStyle,
    this.rightAlignText = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment:
              rightAlignText
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: rightAlignText ? TextAlign.right : TextAlign.left,
              style: titleStyle ??
                  const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: SuratKabarConstants.black,
                    height: 1.1,
                  ),
            ),
            const SizedBox(height: 15),
            Text(
              desc,
              textAlign: rightAlignText ? TextAlign.right : TextAlign.left,
              style: descStyle ??
                  const TextStyle(
                    fontFamily: 'Hanuman',
                    fontSize: 14,
                    color: SuratKabarConstants.black,
                    height: 1.5,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: subFeatures[0]),
              VerticalDivider(
                thickness: 1,
                color: SuratKabarConstants.black,
              ),
              Expanded(child: subFeatures[1]),
              VerticalDivider(
                thickness: 1,
                color: SuratKabarConstants.black,
              ),
              Expanded(child: subFeatures[2]),
            ],
          ),
        ),
        const SizedBox(height: 15),
        const Divider(
          thickness: 1,
          color: SuratKabarConstants.black,
        ),
      ],
    );

    return isDesktop
        ? Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: mainContent,
            ),
          )
        : mainContent;
  }
}

class SubFeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const SubFeatureItem({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 22,
            color: Colors.black87,
          ),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Hanuman',
              fontSize: 9,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}