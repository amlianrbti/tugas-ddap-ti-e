import 'package:flutter/material.dart';
import 'core/language_controller.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({super.key});

  @override
  State<MobileDrawer> createState() => _MobileDrawerState();
}

class _MobileDrawerState extends State<MobileDrawer> {
  bool lokasiExpanded = false;

  void _showComingSoonDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF4EBE1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Text(
                "COMING SOON".tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Hanuman',
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xFF000000),
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Halaman sedang dalam masa pengembangan.".tr,
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
                  onPressed: () => Navigator.pop(dialogContext),
                  child: Text(
                    'TUTUP'.tr,
                    style: const TextStyle(
                      fontFamily: 'Hanuman',
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: Color(0xFF000000),
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
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.75,
      backgroundColor: const Color(0xFFF4EBE1),
      child: SafeArea(
        child: ValueListenableBuilder<AppLanguage>(
          valueListenable: LanguageController.language,
          builder: (context, lang, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    alignment: Alignment.centerLeft,
                    icon: const Icon(
                      Icons.close,
                      size: 32,
                      color: Color(0xFF000000),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),

                const SizedBox(height: 20),

                _menuItem(
                  title: lang == AppLanguage.en ? 'ABOUT' : 'TENTANG',
                  onTap: () {
                    Navigator.pop(context);
                    _showComingSoonDialog(context);
                  },
                ),

                _lokasiMenu(lang),

                _menuItem(
                  title: lang == AppLanguage.en ? 'NEWSPAPER' : 'SURAT KABAR',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/surat-kabar');
                  },
                ),

                _menuItem(
                  title: lang == AppLanguage.en ? 'GALLERY' : 'GALERI',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/galeri');
                  },
                ),

                const Spacer(),

                Padding(
                  padding: const EdgeInsets.all(24),
                  child: GestureDetector(
                    onTap: LanguageController.toggle,
                    child: Row(
                      children: [
                        const Icon(Icons.language, color: Color(0xFF33221C)),
                        const SizedBox(width: 8),
                        Text(
                          lang == AppLanguage.id ? 'IDN | EN' : 'EN | ID',
                          style: const TextStyle(
                            fontFamily: 'Hanuman',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _menuItem({
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Hanuman',
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Color(0xFF000000),
          ),
        ),
      ),
    );
  }

  Widget _lokasiMenu(AppLanguage lang) {
    final kota = [
      'Jakarta',
      'Bogor',
      'Tangerang',
      'Depok',
      'Bekasi',
      'Surabaya',
      'Malang',
    ];

    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              lokasiExpanded = !lokasiExpanded;
            });
          },
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 14,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    lang == AppLanguage.en ? 'LOCATION' : 'LOKASI',
                    style: const TextStyle(
                      fontFamily: 'Hanuman',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
                Icon(
                  lokasiExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 24,
                  color: const Color(0xFF000000),
                ),
              ],
            ),
          ),
        ),

        AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          crossFadeState: lokasiExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: const SizedBox(),
          secondChild: Container(
            color: const Color(0xFFEFE4D8),
            child: Column(
              children: kota.map((item) {
                return ListTile(
                  contentPadding: const EdgeInsets.only(left: 40),
                  title: Text(
                    item,
                    style: const TextStyle(
                      fontFamily: 'Hanuman',
                      fontSize: 16,
                      color: Color(0xFF000000),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _showComingSoonDialog(context);
                  },
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}