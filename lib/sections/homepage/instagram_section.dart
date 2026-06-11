import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/language_controller.dart';

class InstagramSection extends StatelessWidget {
  const InstagramSection({super.key});

  Future<void> _openInstagram() async {
    await launchUrl(
      Uri.parse('https://www.instagram.com/tokokopituku/'),
      mode: LaunchMode.externalApplication,
    );
  }

  Widget post(String imagePath, String url) {
    return GestureDetector(
      onTap: () async {
        await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication,
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: const Color(0xFFD6BFA6),
              child: const Icon(
                Icons.image,
                color: Color(0xFF4B1715),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final usernameFontSize =
        width < 768 ? 16.0 : (width < 1024 ? 22.0 : 26.0);
    final followFontSize =
        width < 768 ? 14.0 : (width < 1024 ? 18.0 : 22.0);
    final horizontalPadding = width < 768 ? 20.0 : 36.0;
    final verticalPadding = width < 768 ? 10.0 : 14.0;

    return Container(
      color: const Color(0xFFE8E0D3),
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 48),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '★',
                style: TextStyle(
                  color: const Color(0xFF4B1715),
                  fontSize: width < 768 ? 18 : 24,
                ),
              ),
              const SizedBox(width: 16),
              InkWell(
                onTap: _openInstagram,
                borderRadius: BorderRadius.circular(999),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF4B1715),
                    borderRadius: BorderRadius.circular(999),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      )
                    ],
                  ),
                  child: Text(
                    '@tokokopituku',
                    style: TextStyle(
                      fontFamily: 'Hanuman',
                      fontSize: usernameFontSize,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Text(
                '★',
                style: TextStyle(
                  color: const Color(0xFF4B1715),
                  fontSize: width < 768 ? 18 : 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  bottom: 40,
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                  childAspectRatio: 0.85,
                  children: [
                    post('assets/images/post6.png',
                        'https://www.instagram.com/tokokopituku/'),
                    post('assets/images/post5.png',
                        'https://www.instagram.com/tokokopituku/'),
                    post('assets/images/post4.png',
                        'https://www.instagram.com/tokokopituku/'),
                    post('assets/images/post3.png',
                        'https://www.instagram.com/tokokopituku/'),
                    post('assets/images/post2.png',
                        'https://www.instagram.com/tokokopituku/'),
                    post('assets/images/post1.png',
                        'https://www.instagram.com/tokokopituku/'),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: width < 768 ? 160 : 220,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x00E8E0D3),
                        Color(0xCCE8E0D3),
                        Color(0xFFE8E0D3),
                      ],
                      stops: [0.0, 0.5, 0.9],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: width < 768 ? 20 : 32,
                child: Text(
                  'FOLLOW US ON INSTAGRAM'.tr,
                  style: TextStyle(
                    fontFamily: 'Hanuman',
                    fontSize: followFontSize,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF000000),
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}