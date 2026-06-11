import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/language_controller.dart';
import '../../widgets/galery/footer_link_column.dart';
import '../../widgets/galery/social_icons.dart';

class FooterSection extends StatelessWidget {
  final bool isMobile;
  final VoidCallback onGaleriTap;
  const FooterSection({
    super.key,
    required this.isMobile,
    required this.onGaleriTap,
  });

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  void _showNavbarStyleDialog(
    BuildContext context,
    String title,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFF3EAE0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          title: Text(
            title.tr,
            style: const TextStyle(
              fontFamily: 'BrewedCoffee',
              color: Color(0xFF1E1510),
            ),
          ),
          content: Text(
            message.tr,
            style: const TextStyle(
              fontFamily: 'Hanuman',
              color: Color(0xFF382219),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'TUTUP'.tr,
                style: const TextStyle(
                  fontFamily: 'Hanuman',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF382219),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return ValueListenableBuilder<AppLanguage>(
      valueListenable: LanguageController.language,
      builder: (context, lang, child) {
        if (screenWidth < 800) {
          return Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              vertical: 40,
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'INFO TUKU'.tr,
                  style: TextStyle(
                    fontFamily: 'BrewedCoffee',
                    fontSize: 22,
                    color: Color(0xFF1E1510),
                  ),
                ),
                const SizedBox(height: 16),
                Image.asset(
                  'assets/images/tuku_sketch.png',
                  height: 120,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () =>
                      _launchURL('https://www.google.com/maps'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF382219),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: Text(
                    'CARI TOKO TUKU SEKITAR MU!'.tr,
                    style: const TextStyle(
                      fontFamily: 'Hanuman',
                      fontSize: 11,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntrinsicWidth(
                      child: FooterLinkCol(
                        title: 'MAKA GROUP',
                        isMobile: true,
                        onGaleriTap: onGaleriTap,
                        links: const [
                          {
                            'label': 'Makna Angan\nKarya Andanu',
                            'url':
                                'https://www.instagram.com/livinginmaka/?hl=en',
                          },
                          {
                            'label': 'Toodz House',
                            'url':
                                'https://www.instagram.com/toodzhouse/?hl=en',
                          },
                          {
                            'label': 'Beragam Rasa\nIndonesia',
                            'url':
                                'https://www.instagram.com/tokokopituku/',
                          },
                          {
                            'label': 'Futago',
                            'url':
                                'https://www.instagram.com/tokokopituku/',
                          },
                          {
                            'label': 'Toho Cafe',
                            'url':
                                'https://www.instagram.com/tokokopituku/',
                          },
                        ],
                      ),
                    ),
                    const SizedBox(width: 40),
                    IntrinsicWidth(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'INFO TUKU'.tr,
                            style: const TextStyle(
                              fontFamily: 'Hanuman',
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.underline,
                              color: Color(0xFF1E1510),
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildCustomFooterLink(
                            'Tentang',
                            isMobile: true,
                            () {
                              _showNavbarStyleDialog(
                                context,
                                'TENTANG',
                                'Halaman sedang dalam masa pengembangan.',
                              );
                            },
                          ),
                          _buildCustomFooterLink(
                            'Produk',
                            isMobile: true,
                            () {
                              Navigator.pushNamed(context, '/home');
                            },
                          ),
                          _buildCustomFooterLink(
                            'Lokasi Toko',
                            isMobile: true,
                            () {
                              _showNavbarStyleDialog(
                                context,
                                'LOKASI',
                                'Halaman sedang dalam masa pengembangan.',
                              );
                            },
                          ),
                          _buildCustomFooterLink(
                            'Surat Kabar',
                            isMobile: true,
                            () {
                              Navigator.pushNamed(
                                context,
                                '/surat-kabar',
                              );
                            },
                          ),
                          _buildCustomFooterLink(
                            'Galeri',
                            isMobile: true,
                            onGaleriTap,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                IntrinsicWidth(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'INFORMASI LAYANAN'.tr,
                        style: const TextStyle(
                          fontFamily: 'Hanuman',
                          fontSize: 11,
                          fontWeight: FontWeight.w800,
                          decoration: TextDecoration.underline,
                          color: Color(0xFF1E1510),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildLayananSubtitle('Hubungi Kami:'.tr),
                      const SizedBox(height: 6),
                      _buildLayananText('Informasi Umum:'.tr),
                      _buildLayananLink('+62 811 8198 858'),
                      const SizedBox(height: 14),
                      _buildLayananText('Event & Pojok Tuku:'.tr),
                      _buildLayananLink('+62 811 8198 858'),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'FOLLOW US!'.tr,
                      style: const TextStyle(
                        fontFamily: 'Hanuman',
                        fontSize: 11,
                        fontWeight: FontWeight.w800,
                        decoration: TextDecoration.underline,
                        color: Color(0xFF1E1510),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SocialIcon(
                          imagePath: 'assets/images/instagram.png',
                          urlString:
                              'https://www.instagram.com/tokokopituku/',
                        ),
                        SizedBox(width: 16),
                        SocialIcon(
                          imagePath: 'assets/images/linkeldn.png',
                          urlString: 'https://www.linkedin.com/',
                        ),
                        SizedBox(width: 16),
                        SocialIcon(
                          imagePath: 'assets/images/tiktok.png',
                          urlString:
                              'https://www.tiktok.com/@tokokopituku',
                        ),
                        SizedBox(width: 16),
                        SocialIcon(
                          imagePath: 'assets/images/youtube.png',
                          urlString: 'https://www.youtube.com/',
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Divider(color: Color(0xFFE5DCD0), height: 1),
                const SizedBox(height: 20),
                Text(
                  '© 2026 PT KARYA TETANGGA TUKU. ALL RIGHT RESERVED.'
                      .tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Hanuman',
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.shade600,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          );
        }

        return Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: 100,
            vertical: 60,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'INFO TUKU'.tr,
                        style: TextStyle(
                          fontFamily: 'BrewedCoffee',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E1510),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Image.asset(
                        'assets/images/tuku_sketch.png',
                        height: 140,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () =>
                            _launchURL('https://www.google.com/maps'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF321A11),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'CARI TOKO TUKU SEKITAR MU!'.tr,
                          style: const TextStyle(
                            fontFamily: 'Hanuman',
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  FooterLinkCol(
                    title: 'MAKA GROUP',
                    isMobile: false,
                    onGaleriTap: onGaleriTap,
                    links: const [
                      {
                        'label': 'Makna Angan\nKarya Andanu',
                        'url':
                            'https://www.instagram.com/livinginmaka/?hl=en',
                      },
                      {
                        'label': 'Toodz House',
                        'url':
                            'https://www.instagram.com/toodzhouse/?hl=en',
                      },
                      {
                        'label': 'Beragam Rasa\nIndonesia',
                        'url':
                            'https://www.instagram.com/tokokopituku/',
                      },
                      {
                        'label': 'Futago',
                        'url':
                            'https://www.instagram.com/tokokopituku/',
                      },
                      {
                        'label': 'Toho Cafe',
                        'url':
                            'https://www.instagram.com/tokokopituku/',
                      },
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'INFO TUKU'.tr,
                        style: TextStyle(
                          fontFamily: 'Hanuman',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E1510),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildCustomFooterLink(
                        'Tentang',
                        () {
                          _showNavbarStyleDialog(
                            context,
                            'TENTANG',
                            'Halaman sedang dalam masa pengembangan.',
                          );
                        },
                      ),
                      _buildCustomFooterLink(
                        'Produk',
                        () {
                          Navigator.pushNamed(context, '/home');
                        },
                      ),
                      _buildCustomFooterLink(
                        'Lokasi Toko',
                        () {
                          _showNavbarStyleDialog(
                            context,
                            'LOKASI',
                            'Halaman sedang dalam masa pengembangan.',
                          );
                        },
                      ),
                      _buildCustomFooterLink(
                        'Surat Kabar',
                        () {
                          Navigator.pushNamed(
                            context,
                            '/surat-kabar',
                          );
                        },
                      ),
                      _buildCustomFooterLink(
                        'Galeri',
                        onGaleriTap,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'FOLLOW US!'.tr,
                        style: const TextStyle(
                          fontFamily: 'Hanuman',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E1510),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const SocialIcon(
                        imagePath: 'assets/images/instagram.png',
                        urlString:
                            'https://www.instagram.com/tokokopituku/',
                      ),
                      const SizedBox(height: 14),
                      const SocialIcon(
                        imagePath: 'assets/images/linkeldn.png',
                        urlString: 'https://www.linkedin.com/',
                      ),
                      const SizedBox(height: 14),
                      const SocialIcon(
                        imagePath: 'assets/images/tiktok.png',
                        urlString:
                            'https://www.tiktok.com/@tokokopituku',
                      ),
                      const SizedBox(height: 14),
                      const SocialIcon(
                        imagePath: 'assets/images/youtube.png',
                        urlString: 'https://www.youtube.com/',
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'INFORMASI LAYANAN'.tr,
                        style: const TextStyle(
                          fontFamily: 'Hanuman',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1E1510),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildLayananSubtitle('Hubungi Kami:'.tr),
                      const SizedBox(height: 6),
                      _buildLayananText('Informasi Umum:'.tr),
                      _buildLayananLink('+62 811 8198 858'),
                      const SizedBox(height: 14),
                      _buildLayananText('Event & Pojok Tuku:'.tr),
                      _buildLayananLink('+62 811 8198 858'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 60),
              const Divider(color: Color(0xFFE5DCD0), height: 1),
              const SizedBox(height: 25),
              Text(
                '© 2026 PT KARYA TETANGGA TUKU. ALL RIGHT RESERVED.'
                    .tr,
                style: TextStyle(
                  fontFamily: 'Hanuman',
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCustomFooterLink(
    String label,
    VoidCallback onTap, {
    bool isMobile = false,
  }) {
    return Padding(
      padding: EdgeInsets.only(bottom: isMobile ? 8.0 : 12.0),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Text(
            label.tr,
            style: TextStyle(
              fontFamily: 'Hanuman',
              fontSize: isMobile ? 9 : 14,
              color: const Color(0xFF382219),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLayananSubtitle(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Hanuman',
        fontSize: 13,
        fontWeight: FontWeight.bold,
        color: Color(0xFF5C4033),
      ),
    );
  }

  Widget _buildLayananText(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Hanuman',
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildLayananLink(String phone) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => launchUrl(
          Uri.parse(
            'https://wa.me/${phone.replaceAll(' ', '').replaceAll('+', '')}',
          ),
        ),
        child: Text(
          phone,
          style: const TextStyle(
            fontFamily: 'Hanuman',
            fontSize: 13,
            color: Color(0xFF5C4033),
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}