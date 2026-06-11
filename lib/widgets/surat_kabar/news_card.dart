import 'package:flutter/material.dart';
import '../../utils/surat_kabar_constants.dart';
import '../../core/language_controller.dart';

class NewsCard extends StatelessWidget {
  final String title;
  final String desc;
  final String imageAsset;
  final bool isDesktop;
  final VoidCallback onTap;

  const NewsCard({
    super.key,
    required this.title,
    required this.desc,
    required this.imageAsset,
    required this.isDesktop,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget cardContent = Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flex(
              direction: isDesktop ? Axis.horizontal : Axis.vertical,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    imageAsset,
                    width: isDesktop ? 120 : double.infinity,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: isDesktop ? 14 : 0,
                  height: isDesktop ? 0 : 15,
                ),
                Expanded(
                  flex: isDesktop ? 1 : 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: SuratKabarConstants.black,
                          height: 1.25,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        desc,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Hanuman',
                          fontSize: 12,
                          color: Colors.black54,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            InkWell(
              onTap: onTap,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "BACA SELENGKAPNYA".tr,
                    style: const TextStyle(
                      fontFamily: 'Hanuman',
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: SuratKabarConstants.black,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 18,
                    color: SuratKabarConstants.black,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return isDesktop ? Expanded(child: cardContent) : cardContent;
  }
}