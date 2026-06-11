import 'package:flutter/material.dart';
import '../../core/language_controller.dart';

class SplitTabs extends StatelessWidget {
  final bool isMobile;
  final VoidCallback onKegiatanTap;
  final VoidCallback onTokoTap;

  const SplitTabs({
    super.key,
    required this.isMobile,
    required this.onKegiatanTap,
    required this.onTokoTap,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> tabs = [
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onKegiatanTap,
          child: Container(
            height: isMobile ? 50 : 80,
            color: const Color(0xFFA5664C),
            alignment: Alignment.center,
            child: Text(
              'KEGIATAN'.tr,
              style: TextStyle(
                fontFamily: 'Hanuman',
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: isMobile ? 15 : 20,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ),
      MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTokoTap,
          child: Container(
            height: isMobile ? 50 : 80,
            color: const Color(0xFFDF9F3D),
            alignment: Alignment.center,
            child: Text(
              'TOKO'.tr,
              style: TextStyle(
                fontFamily: 'Hanuman',
                fontWeight: FontWeight.w600,
                color: const Color(0xFF000000),
                fontSize: isMobile ? 15 : 20,
                letterSpacing: 1.5,
              ),
            ),
          ),
        ),
      ),
    ];

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: tabs,
      );
    }

    return Row(
      children: tabs.map((tab) => Expanded(child: tab)).toList(),
    );
  }
}