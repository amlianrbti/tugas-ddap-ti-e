import 'package:flutter/material.dart';

import '../core/language_controller.dart';
import '../mobile_drawer.dart';
import '../navbar.dart';
import '../sections/galery/footer_section.dart';
import '../sections/surat_kabar/hero_section.dart';
import '../sections/surat_kabar/neighborhood_section.dart';
import '../sections/surat_kabar/news_section.dart';
import '../sections/surat_kabar/product_section.dart';
import '../sections/surat_kabar/sustainability_section.dart';
import '../utils/surat_kabar_constants.dart';
import '../widgets/surat_kabar/category_button.dart';

class SuratKabarPage extends StatefulWidget {
  const SuratKabarPage({super.key});

  @override
  State<SuratKabarPage> createState() => _SuratKabarPageState();
}

class _SuratKabarPageState extends State<SuratKabarPage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _produkKey = GlobalKey();
  final GlobalKey _tetanggaKey = GlobalKey();
  final GlobalKey _keberlanjutanKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final sectionContext = key.currentContext;

    if (sectionContext != null) {
      Scrollable.ensureVisible(
        sectionContext,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void _showComingSoonDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: SuratKabarConstants.paperColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Text(
                'COMING SOON'.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Hanuman',
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Color(0xFF000000),
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Nantikan berita lengkap dan keseruan cerita rukun bertetangga lainnya segera!'
                    .tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Hanuman',
                  fontSize: 15,
                  color: Color(0xFF000000),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    foregroundColor: SuratKabarConstants.black,
                    splashFactory: NoSplash.splashFactory,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                  ),
                  child: Text(
                    'TUTUP'.tr,
                    style: const TextStyle(
                      fontFamily: 'Hanuman',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isDesktop = width > 800;
    final horizontalPadding = isDesktop ? 50.0 : 20.0;

    return Scaffold(
      backgroundColor: SuratKabarConstants.paperColor,
      drawer: const MobileDrawer(),
      appBar: const Navbar(),
      body: ValueListenableBuilder<AppLanguage>(
        valueListenable: LanguageController.language,
        builder: (context, lang, _) {
          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                HeroSection(
                  isDesktop: isDesktop,
                  padding: horizontalPadding,
                ),
                isDesktop
                    ? Row(
                        children: [
                          CategoryButton(
                            title: 'PRODUK YANG KONSISTEN'.tr,
                            color: SuratKabarConstants.colorProduk,
                            isDesktop: true,
                            onTap: () => _scrollToSection(_produkKey),
                          ),
                          CategoryButton(
                            title: 'BERTETANGGA BAIK'.tr,
                            color: SuratKabarConstants.colorTetangga,
                            isDesktop: true,
                            onTap: () => _scrollToSection(_tetanggaKey),
                          ),
                          CategoryButton(
                            title: 'MENJUNJUNG KEBERLANJUTAN'.tr,
                            color: SuratKabarConstants.colorLanjut,
                            isDesktop: true,
                            onTap: () => _scrollToSection(_keberlanjutanKey),
                          ),
                        ],
                      )
                    : Column(
                        children: [
                          CategoryButton(
                            title: 'PRODUK YANG KONSISTEN'.tr,
                            color: SuratKabarConstants.colorProduk,
                            isDesktop: false,
                            onTap: () => _scrollToSection(_produkKey),
                          ),
                          CategoryButton(
                            title: 'BERTETANGGA BAIK'.tr,
                            color: SuratKabarConstants.colorTetangga,
                            isDesktop: false,
                            onTap: () => _scrollToSection(_tetanggaKey),
                          ),
                          CategoryButton(
                            title: 'MENJUNJUNG KEBERLANJUTAN'.tr,
                            color: SuratKabarConstants.colorLanjut,
                            isDesktop: false,
                            onTap: () => _scrollToSection(_keberlanjutanKey),
                          ),
                        ],
                      ),
                const SizedBox(height: 60),
                Container(key: _produkKey),
                ProductSection(
                  isDesktop: isDesktop,
                  horizontalPadding: horizontalPadding,
                ),
                Container(key: _tetanggaKey),
                NeighborhoodSection(
                  isDesktop: isDesktop,
                  horizontalPadding: horizontalPadding,
                ),
                Container(key: _keberlanjutanKey),
                SustainabilitySection(
                  isDesktop: isDesktop,
                  horizontalPadding: horizontalPadding,
                ),
                NewsSection(
                  isDesktop: isDesktop,
                  horizontalPadding: horizontalPadding,
                  onComingSoon: _showComingSoonDialog,
                ),
                const SizedBox(height: 100),
                FooterSection(
                  isMobile: !isDesktop,
                  onGaleriTap: () {
                    Navigator.pushNamed(context, '/surat-kabar');
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}