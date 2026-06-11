import 'package:flutter/material.dart';
import '../../widgets/surat_kabar/bottom_quote.dart';
import '../../utils/surat_kabar_constants.dart';
import '../../widgets/surat_kabar/flexible_wrapper.dart';
import '../../widgets/surat_kabar/icon_text_column.dart';
import '../../widgets/surat_kabar/section_title.dart';
import '../../core/language_controller.dart';

class ProductSection extends StatelessWidget {
  final bool isDesktop;
  final double horizontalPadding;

  const ProductSection({
    super.key,
    required this.isDesktop,
    required this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "SPESIALISASI PRODUK".tr,
          style: const TextStyle(
            fontFamily: 'BrewedCoffee',
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
          ),
          child: Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlexibleWrapper(
                isDesktop: isDesktop,
                child: IconTextColumn(
                  title: "EKSPLORASI".tr,
                  titleStyle: const TextStyle(
                    fontFamily: 'BrewedCoffee',
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                  desc:
                      "Digerakan oleh semangat riset dan pengembangan dari hasil bumi Indonesia untuk menghadirkan produk yang nyaman di lidah dan nyaman di hati."
                          .tr,
                  isDesktop: isDesktop,
                  subFeatures: [
                    SubFeatureItem(
                      icon: Icons.search,
                      text: "RISET BAHAN BERKUALITAS".tr,
                    ),
                    SubFeatureItem(
                      icon: Icons.favorite_border,
                      text: "INOVASI RASA BERKELANJUTAN".tr,
                    ),
                    SubFeatureItem(
                      icon: Icons.local_cafe_outlined,
                      text: "NYAMAN DI LIDAH, NYAMAN DI HATI".tr,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: isDesktop ? 20 : 0,
                height: isDesktop ? 0 : 40,
              ),
              FlexibleWrapper(
                isDesktop: isDesktop,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/spesialisasi-produk.png',
                        height: 220,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "KESEIMBANGAN\nPRODUK".tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'BrewedCoffee',
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: SuratKabarConstants.black,
                          height: 1.1,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: isDesktop ? 20 : 0,
                height: isDesktop ? 0 : 40,
              ),
              FlexibleWrapper(
                isDesktop: isDesktop,
                child: IconTextColumn(
                  title: "KONSISTENSI".tr,
                  titleStyle: const TextStyle(
                    fontFamily: 'BrewedCoffee',
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                  desc:
                      "Stabilitas pada kualitas rasa dan kecepatan penyajian demi menjaga posisi TUKU sebagai pilihan yang dapat diandalkan tetangga."
                          .tr,
                  isDesktop: isDesktop,
                  rightAlignText: true,
                  subFeatures: [
                    SubFeatureItem(
                      icon: Icons.military_tech_outlined,
                      text: "KUALITAS TERJAGA".tr,
                    ),
                    SubFeatureItem(
                      icon: Icons.access_time,
                      text: "PENYAJIAN KONSISTEN".tr,
                    ),
                    SubFeatureItem(
                      icon: Icons.thumb_up_alt_outlined,
                      text: "DAPAT DIANDALKAN".tr,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        BottomQuote(
          text:
              "Menikmati manisnya, pahitnya, hangatnya, sejuknya, rukun bertetangga."
                  .tr,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}