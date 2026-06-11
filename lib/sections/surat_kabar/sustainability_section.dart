import 'package:flutter/material.dart';
import '../../utils/surat_kabar_constants.dart';
import '../../widgets/surat_kabar/bottom_quote.dart';
import '../../widgets/surat_kabar/flexible_wrapper.dart';
import '../../widgets/surat_kabar/section_title.dart';
import '../../widgets/surat_kabar/vertical_detail_item.dart';
import '../../core/language_controller.dart';

class SustainabilitySection extends StatelessWidget {
  final bool isDesktop;
  final double horizontalPadding;

  const SustainabilitySection({
    super.key,
    required this.isDesktop,
    required this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "MENJUNJUNG KEBERLANJUTAN".tr,
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
          child: Column(
            children: [
              Flex(
                direction: isDesktop ? Axis.horizontal : Axis.vertical,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlexibleWrapper(
                    isDesktop: isDesktop,
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: isDesktop
                          ? CrossAxisAlignment.start
                          : CrossAxisAlignment.center,
                      children: [
                        VerticalDetailItem(
                          title: "MEMBUAT GERAKAN".tr,
                          desc: "",
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Waste Management\nCommunity Empowerment\nRecycle & Upcycle."
                              .tr,
                          textAlign: isDesktop
                              ? TextAlign.left
                              : TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Hanuman',
                            fontSize: 14,
                            height: 1.6,
                            color: SuratKabarConstants.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: isDesktop ? 20 : 0,
                    height: isDesktop ? 0 : 30,
                  ),
                  FlexibleWrapper(
                    isDesktop: isDesktop,
                    flex: 6,
                    child: Center(
                      child: Image.asset(
                        'assets/images/rantai-keberlanjutan.png',
                        height: isDesktop ? 280 : 180,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: isDesktop ? 20 : 0,
                    height: isDesktop ? 0 : 30,
                  ),
                  FlexibleWrapper(
                    isDesktop: isDesktop,
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: isDesktop
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.center,
                      children: [
                        VerticalDetailItem(
                          title: "MEMBAWA DAMPAK".tr,
                          desc: "",
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Responsible Sourcing\nCommunity Organizing\nReforestation."
                              .tr,
                          textAlign: isDesktop
                              ? TextAlign.right
                              : TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Hanuman',
                            fontSize: 14,
                            height: 1.6,
                            color: SuratKabarConstants.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              BottomQuote(
                text:
                    "Satu langkah kecil hari ini untuk beribu cerita baik di kemudian hari."
                        .tr,
              ),
            ],
          ),
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}