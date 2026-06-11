import 'package:flutter/material.dart';

class SuratKabarSection extends StatelessWidget {
  const SuratKabarSection({super.key});

  void _openArticle(String article) {
    debugPrint('Open Article: $article');
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Container(
          width: double.infinity,
          color: const Color(0xFFE8E0D3),
          child: AspectRatio(
            aspectRatio: isMobile ? 402 / 282 : 1440 / 682,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    isMobile
                        ? 'assets/images/surat_kabar_mobile.png'
                        : 'assets/images/surat_kabar_desktop.png',
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                if (!isMobile) ...[
                  Positioned(
                    left: 260,
                    top: 170,
                    width: 220,
                    height: 320,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => _openArticle('spesialisasi-produk'),
                        child: Container(color: Colors.transparent),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 520,
                    top: 160,
                    width: 230,
                    height: 340,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => _openArticle('bertetangga-baik'),
                        child: Container(color: Colors.transparent),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 780,
                    top: 140,
                    width: 240,
                    height: 360,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => _openArticle('keberlanjutan'),
                        child: Container(color: Colors.transparent),
                      ),
                    ),
                  ),
                ] else ...[
                  Positioned(
                    left: 95,
                    top: 105,
                    width: 90,
                    height: 140,
                    child: GestureDetector(
                      onTap: () => _openArticle('spesialisasi-produk'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                  Positioned(
                    left: 190,
                    top: 105,
                    width: 95,
                    height: 140,
                    child: GestureDetector(
                      onTap: () => _openArticle('bertetangga-baik'),
                      child: Container(color: Colors.transparent),
                    ),
                  ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}