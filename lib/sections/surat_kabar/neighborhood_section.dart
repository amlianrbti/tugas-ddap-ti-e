import 'package:flutter/material.dart';
import '../../widgets/surat_kabar/flexible_wrapper.dart';
import '../../widgets/surat_kabar/quote_divider.dart';
import '../../widgets/surat_kabar/section_title.dart';
import '../../widgets/surat_kabar/vertical_detail_item.dart';
import '../../core/language_controller.dart';

class NeighborhoodSection extends StatelessWidget {
  final bool isDesktop;
  final double horizontalPadding;

  const NeighborhoodSection({
    super.key,
    required this.isDesktop,
    required this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "BERTETANGGA BAIK".tr,
          style: const TextStyle(
            fontFamily: 'BrewedCoffee',
            fontSize: 36,
            fontWeight: FontWeight.w600,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              Flex(
                direction: isDesktop ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FlexibleWrapper(
                    isDesktop: isDesktop,
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VerticalDetailItem(
                          title: "SENYUM, SALAM, SAPA".tr,
                          desc:
                              "Budaya dari seluruh lapisan struktur keluarga TUKU. Sebuah upaya untuk mengenal, memahami, dan mendengarkan tetangga."
                                  .tr,
                        ),
                        const SizedBox(height: 35),
                        VerticalDetailItem(
                          title: "KUMPUL KELUARGA TUKU".tr,
                          desc:
                              "Berkegiatan bersama tetangga. Kadang untuk perayaan, kadang hanya untuk bersenda-gurau, yang penting bisa berkumpul."
                                  .tr,
                        ),
                        const SizedBox(height: 35),
                        VerticalDetailItem(
                          title: "KARTU RUKUN TETANGGA".tr,
                          desc:
                              "Kalau negara punya TKR, TUKU punya KaRT. Sebuah tanda eratnya pertetangan. Belajar bersama, membuat gerakan bersama juga."
                                  .tr,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: isDesktop ? 40 : 0,
                    height: isDesktop ? 0 : 40,
                  ),
                  FlexibleWrapper(
                    isDesktop: isDesktop,
                    flex: 6,
                    child: Center(
                      child: Image.asset(
                        'assets/images/tangga.png',
                        height: isDesktop ? 300 : 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              QuoteDivider(isDesktop: isDesktop),
            ],
          ),
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}