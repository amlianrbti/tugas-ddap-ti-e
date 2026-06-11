import 'package:flutter/material.dart';

import '../../utils/surat_kabar_constants.dart';
import '../../widgets/surat_kabar/news_card.dart';
import '../../widgets/surat_kabar/section_title.dart';
// 1. Import language controller agar ekstensi .tr terbaca
import '../../core/language_controller.dart'; 

class NewsSection extends StatelessWidget {
  final bool isDesktop;
  final double horizontalPadding;
  final VoidCallback onComingSoon;

  const NewsSection({
    super.key,
    required this.isDesktop,
    required this.horizontalPadding,
    required this.onComingSoon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: SuratKabarConstants.paperColor,
      padding: EdgeInsets.symmetric(
        vertical: 40,
        horizontal: horizontalPadding,
      ),
      child: Column(
        children: [
          // 2. Tambahkan .tr di judul seksi utama (keyword const dihapus)
          SectionTitle(
            title: "DAFTAR BERITA".tr,
            style: const TextStyle(
              fontFamily: 'BrewedCoffee',
              fontSize: 36,
              fontWeight: FontWeight.w900,
            ),
          ),

          const SizedBox(height: 20),

          Flex(
            direction: isDesktop ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 3. Tambahkan .tr pada title dan desc di setiap NewsCard
              NewsCard(
                title: "MULAI HARI ATAU TUTUP HARI, ADA COLD DRIP PAGI DAN SORE".tr,
                desc: "Memulai hari dengan segelas kopi menjadi satu hal yang tidak terlewatkan. Ketika tubuh dan pikiran membutuhkan kesegaran rukun bertetangga...".tr,
                imageAsset: 'assets/images/berita.webp',
                isDesktop: isDesktop,
                onTap: onComingSoon,
              ),

              NewsCard(
                title: "MENGENAL PROSES PASCA PANEN BIJI KOPI TETANGGA".tr,
                desc: "Melihat lebih dekat perjalanan biji kopi lokal hasil dedikasi para petani nusantara, dirawat dengan konsistensi penuh untuk menjaga cita rasa otentik...".tr,
                imageAsset: 'assets/images/berita.webp',
                isDesktop: isDesktop,
                onTap: onComingSoon,
              ),

              NewsCard(
                title: "CERITA DI BALIK HANGATNYA RUANG KUMPUL TETANGGA".tr,
                desc: "Bukan sekadar tempat singgah, TUKU hadir membangun ruang interaksi yang erat. Setiap sudut menyimpan cerita hangat tentang kebersamaan kita...".tr,
                imageAsset: 'assets/images/berita.webp',
                isDesktop: isDesktop,
                onTap: onComingSoon,
              ),
            ],
          ),

          const SizedBox(height: 50),

          // PASTIKAN tidak ada kata kunci 'const' di depan ElevatedButton ini
          ElevatedButton(
            onPressed: onComingSoon,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF33221C),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 45,
                vertical: 24,
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              elevation: 3,
              alignment: Alignment.center,
            ),
            child: Text(
              'TELUSURI BERITA SELENGKAPNYA'.tr, // Sudah dinamis 👍
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Hanuman',
                letterSpacing: 1.5,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}