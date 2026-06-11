import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../cooming_soon.dart';
import '../../core/language_controller.dart';

class FooterLinkCol extends StatelessWidget {
  final String title;
  final List<Map<String, String>> links;
  final bool isMobile;
  final VoidCallback onGaleriTap;

  const FooterLinkCol({
    super.key,
    required this.title,
    required this.links,
    required this.onGaleriTap,
    this.isMobile = false,
  });

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);

    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double titleSize = isMobile ? 11 : 15;
    final double linkSize = isMobile ? 9 : 14;
    final double bottomPadding = isMobile ? 8 : 14;
    final double topSpacing = isMobile ? 12 : 20;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr,
          style: TextStyle(
            fontFamily: 'Hanuman',
            fontSize: titleSize,
            fontWeight: FontWeight.w800,
            decoration: TextDecoration.underline,
            color: const Color(0xFF000000),
          ),
        ),
        SizedBox(height: topSpacing),
        ...links.map(
          (linkMap) => Padding(
            padding: EdgeInsets.only(bottom: bottomPadding),
            child: GestureDetector(
              onTap: () {
                final String label = linkMap['label'] ?? '';

                if (label == 'Galeri') {
                  onGaleriTap();
                } else if (label == 'Tentang' ||
                    label == 'Produk' ||
                    label == 'Lokasi Toko' ||
                    label == 'Surat Kabar') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ComingSoonPage(),
                    ),
                  );
                } else {
                  final String url = linkMap['url'] ?? '';

                  if (url.isNotEmpty) {
                    _launchURL(url);
                  }
                }
              },
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Text(
                  linkMap['label']!.tr,
                  style: TextStyle(
                    fontFamily: 'Hanuman',
                    fontSize: linkSize,
                    color: Colors.black87,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}