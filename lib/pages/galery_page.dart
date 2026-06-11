import 'package:flutter/material.dart';
import '../core/language_controller.dart';
import '../data/kegiatan_data.dart';
import '../data/toko_data.dart';
import '../mobile_drawer.dart';
import '../navbar.dart';
import '../sections/galery/footer_section.dart';
import '../sections/galery/hero_section.dart';
import '../sections/galery/kegiatan_section.dart';
import '../sections/galery/split_tabs.dart';
import '../sections/galery/toko_section.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _kegiatanKey = GlobalKey();
  final GlobalKey _tokoKey = GlobalKey();

  int _kegiatanIndex = 1;
  int _tokoIndex = 1;

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;

    return Scaffold(
      appBar: const Navbar(),
      drawer: const MobileDrawer(),
      body: ValueListenableBuilder<AppLanguage>(
        valueListenable: LanguageController.language,
        builder: (context, lang, child) {
          return SelectionArea(
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  HeroSection(
                    isMobile: isMobile,
                  ),
                  SplitTabs(
                    isMobile: isMobile,
                    onKegiatanTap: () => _scrollToSection(_kegiatanKey),
                    onTokoTap: () => _scrollToSection(_tokoKey),
                  ),
                  KegiatanSection(
                    key: _kegiatanKey,
                    isMobile: isMobile,
                    kegiatanIndex: _kegiatanIndex,
                    kegiatanList: kegiatanList,
                    onChanged: (index) {
                      setState(() {
                        _kegiatanIndex = index;
                      });
                    },
                  ),
                  TokoSection(
                    key: _tokoKey,
                    isMobile: isMobile,
                    tokoIndex: _tokoIndex,
                    tokoList: tokoList,
                    onChanged: (index) {
                      setState(() {
                        _tokoIndex = index;
                      });
                    },
                  ),
                  FooterSection(
                    isMobile: isMobile,
                    onGaleriTap: () {
                      _scrollToSection(_kegiatanKey);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}