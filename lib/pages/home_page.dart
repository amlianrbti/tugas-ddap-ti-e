import 'package:flutter/material.dart';
import '../core/language_controller.dart';
import '../mobile_drawer.dart';
import '../navbar.dart';
import '../sections/homepage/hero_section.dart';
import '../sections/homepage/instagram_section.dart';
import '../sections/homepage/our_story_section.dart';
import '../sections/homepage/product_section.dart';
import '../sections/homepage/surat_kabar_section.dart';
import '../sections/homepage/toserbaku_section.dart';
import '../sections/galery/footer_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MobileDrawer(),
      body: Column(
        children: [
          const Navbar(),
          Expanded(
            child: SingleChildScrollView(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isMobile = constraints.maxWidth < 768;

                  return ValueListenableBuilder<AppLanguage>(
                    valueListenable: LanguageController.language,
                    builder: (context, lang, _) {
                      return Column(
                        children: [
                          const HeroSection(),
                          const OurStorySection(),
                          const ProductSection(),
                          ToserbakuSection(),
                          const SuratKabarSection(),
                          const InstagramSection(),
                          FooterSection(
                            isMobile: isMobile,
                            onGaleriTap: () {
                              Navigator.pushNamed(context, '/home');
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}