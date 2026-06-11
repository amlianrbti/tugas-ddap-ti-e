import 'package:flutter/material.dart';
import 'core/language_controller.dart';

class Navbar extends StatelessWidget implements PreferredSizeWidget {
  const Navbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  void _comingSoon(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF4EBE1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
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
                ),
              ),

              const SizedBox(height: 24),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "TUTUP".tr,
                    style: const TextStyle(
                      fontFamily: 'Hanuman',
                      fontWeight: FontWeight.w600,
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
    final isMobile = MediaQuery.of(context).size.width < 768;

    final daftarKota = [
      'Jakarta',
      'Bogor',
      'Tangerang',
      'Depok',
      'Bekasi',
      'Surabaya',
      'Malang',
    ];

    return Container(
      height: 60,
      color: const Color(0xFF3B2A22),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          if (isMobile) ..._buildMobile(context),
          if (!isMobile) ..._buildDesktop(context, daftarKota),
        ],
      ),
    );
  }

  List<Widget> _buildMobile(BuildContext context) {
    return [
      Builder(
        builder: (scaffoldContext) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
              size: 28,
            ),
            onPressed: () {
              Scaffold.maybeOf(scaffoldContext)?.openDrawer();
            },
          );
        },
      ),

      Expanded(
        child: Center(
          child: GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/home'),
            child: Image.asset(
              'assets/images/logoTuku.png',
              height: 30,
            ),
          ),
        ),
      ),

      const SizedBox(width: 48),
    ];
  }

  List<Widget> _buildDesktop(
    BuildContext context,
    List<String> daftarKota,
  ) {
    return [
      GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/home'),
        child: Image.asset(
          'assets/images/logoTuku.png',
          height: 30,
        ),
      ),

      const Spacer(),

      ValueListenableBuilder<AppLanguage>(
        valueListenable: LanguageController.language,
        builder: (context, lang, _) {
          return Row(
            children: [
              NavItem(
                title: lang == AppLanguage.en ? 'ABOUT' : 'TENTANG',
                onTap: () => _comingSoon(context),
              ),

              const SizedBox(width: 30),

              PopupMenuButton<String>(
                tooltip: '',
                offset: const Offset(0, 40),
                color: const Color(0xFFF4EBE1),
                onSelected: (_) => _comingSoon(context),
                itemBuilder: (context) {
                  return daftarKota.map((kota) {
                    return PopupMenuItem<String>(
                      value: kota,
                      child: Text(
                        kota,
                        style: const TextStyle(
                          fontFamily: 'Hanuman',
                          color: Color(0xFF000000),
                        ),
                      ),
                    );
                  }).toList();
                },
                child: Row(
                  children: [
                    Text(
                      lang == AppLanguage.en ? 'LOCATION' : 'LOKASI',
                      style: const TextStyle(
                        fontFamily: 'Hanuman',
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 30),

              NavItem(
                title: lang == AppLanguage.en
                    ? 'NEWSPAPER'
                    : 'SURAT KABAR',
                onTap: () =>
                    Navigator.pushNamed(context, '/surat-kabar'),
              ),

              const SizedBox(width: 30),

              NavItem(
                title: lang == AppLanguage.en ? 'GALLERY' : 'GALERI',
                onTap: () => Navigator.pushNamed(context, '/galeri'),
              ),

              const SizedBox(width: 30),

              GestureDetector(
                onTap: () => LanguageController.toggle(),
                child: Row(
                  children: [
                    const Icon(
                      Icons.language,
                      color: Colors.white,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      lang == AppLanguage.id ? 'IDN | EN' : 'EN | ID',
                      style: const TextStyle(
                        fontFamily: 'Hanuman',
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    ];
  }
}

class NavItem extends StatefulWidget {
  final String title;
  final VoidCallback? onTap;

  const NavItem({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  State<NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.title,
          style: TextStyle(
            fontFamily: 'Hanuman',
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: hover ? Colors.white70 : Colors.white,
          ),
        ),
      ),
    );
  }
}