import 'package:flutter/material.dart';
import '../../utils/surat_kabar_constants.dart';
import '../../widgets/surat_kabar/flexible_wrapper.dart';
import '../../core/language_controller.dart';

class HeroSection extends StatelessWidget {
  final bool isDesktop;
  final double padding;

  const HeroSection({
    super.key,
    required this.isDesktop,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: Flex(
        direction: isDesktop ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlexibleWrapper(
            isDesktop: isDesktop,
            child: Padding(
              padding: EdgeInsets.only(top: isDesktop ? 40 : 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SURAT KABAR\nTUKU'.tr,
                    style: TextStyle(
                      fontSize: isDesktop ? 80 : 45,
                      fontFamily: 'BrewedCoffee',
                      color: SuratKabarConstants.black,
                      height: 0.9,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: isDesktop ? 140 : 90,
                    child: Stack(
                      children: [
                        Positioned(
                          left: isDesktop ? -80 : -35,
                          top: -80,
                          child: IgnorePointer(
                            child: Opacity(
                              opacity: 0.9,
                              child: Image.asset(
                                'assets/images/kopiPohon.png',
                                width: isDesktop ? 280 : 160,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'DAPATKAN CERITA BAGAIMANA TUKU MENJAGA\nKUALITAS SETIAP PRODUKNYA DAN MEMBERIKAN\nGERAKAN BERDAMPAK.'
                                .tr,
                            style: TextStyle(
                              fontFamily: 'Hanuman',
                              fontSize: isDesktop ? 16 : 13,
                              color: SuratKabarConstants.black,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: isDesktop ? 40 : 0,
            height: isDesktop ? 0 : 30,
          ),
          FlexibleWrapper(
            isDesktop: isDesktop,
            child: Container(
              height: isDesktop ? 350 : 220,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/toko-tuku.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}