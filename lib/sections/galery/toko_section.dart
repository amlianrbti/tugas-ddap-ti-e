import 'package:flutter/material.dart';

import '../../core/language_controller.dart';
import '../../widgets/galery/carousel_arrow.dart';
import '../../widgets/galery/carousel_card.dart';
import '../../widgets/galery/divider_with_text.dart';

class TokoSection extends StatelessWidget {
  final bool isMobile;
  final int tokoIndex;
  final List<Map<String, String>> tokoList;
  final Function(int) onChanged;

  const TokoSection({
    super.key,
    required this.isMobile,
    required this.tokoIndex,
    required this.tokoList,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isTablet = screenWidth >= 600 && screenWidth < 1100;
    final double carouselHeight = isMobile ? 230 : (isTablet ? 305 : 435);

    return Container(
      padding: EdgeInsets.only(
        top: isMobile ? 24 : 48,
        bottom: isMobile ? 32 : 64,
      ),
      color: const Color(0xFFF3EAE0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              'TOKO'.tr,
              style: TextStyle(
                fontFamily: 'BrewedCoffee',
                fontSize: isMobile ? 24 : 36,
                color: const Color(0xFF000000),
                letterSpacing: 1.0,
              ),
            ),
          ),
          SizedBox(height: isMobile ? 12 : 24),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: carouselHeight,
                child: OverflowBox(
                  maxWidth: double.infinity,
                  maxHeight: double.infinity,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(3, (index) {
                      final int dataIndex = (tokoIndex - 1 + index + tokoList.length) % tokoList.length;
                      final bool isActive = index == 1;

                      return CarouselCard(
                        title: tokoList[dataIndex]['title']!.tr,
                        image: tokoList[dataIndex]['image']!,
                        isActive: isActive,
                        screenWidth: screenWidth,
                        onTap: () {
                          onChanged(dataIndex);
                        },
                      );
                    }),
                  ),
                ),
              ),
              Positioned(
                left: isMobile ? 12 : 24,
                child: CarouselArrow(
                  icon: Icons.arrow_back_ios_new,
                  isMobile: isMobile,
                  onPressed: () {
                    onChanged(
                      (tokoIndex - 1 + tokoList.length) % tokoList.length,
                    );
                  },
                ),
              ),
              Positioned(
                right: isMobile ? 12 : 24,
                child: CarouselArrow(
                  icon: Icons.arrow_forward_ios,
                  isMobile: isMobile,
                  onPressed: () {
                    onChanged((tokoIndex + 1) % tokoList.length);
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: isMobile ? 30 : 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: DividerWithText(
              text: tokoList[tokoIndex]['subtext']!.tr,
              isMobile: isMobile,
            ),
          ),
        ],
      ),
    );
  }
}