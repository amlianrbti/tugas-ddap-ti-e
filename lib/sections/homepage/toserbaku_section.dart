import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/language_controller.dart'; // <--- Memastikan path import Anda benar

class ToserbakuSection extends StatelessWidget {
  const ToserbakuSection({super.key});

  TextStyle _hanumanStyle({double? fontSize, FontWeight? fontWeight, Color? color, double? height}) {
    return TextStyle(
      fontFamily: "Hanuman",
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      height: height,
    );
  }

  TextStyle _brewedCoffeeStyle({double? fontSize, Color? color}) {
    return TextStyle(
      fontFamily: "BrewedCoffee",
      fontSize: fontSize,
      color: color ?? Colors.black,
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<AppLanguage>(
      valueListenable: LanguageController.language,
      builder: (context, lang, _) {
        final List<Map<String, String>> products = [
          {
            "name": "BOTOL MINUM TETANGGA TUKU DONAT",
            "price": "Rp. 70.000",
            "img": "assets/images/product/botol.png"
          },
          {
            "name": "MUKENA TRAVEL",
            "price": "Rp. 299.000",
            "img": "assets/images/product/mukena.png"
          },
          {
            "name": "TAS TERPAL TUKU",
            "price": "Rp. 100.000",
            "img": "assets/images/product/tas_terpal.png"
          },
          {
            "name": "KAOS KAKI #TETANGGATUKU KECIL",
            "price": "Rp. 88.000",
            "img": "assets/images/product/kaos_kaki_kecil.png"
          },
          {
            "name": "KAUS KAKI #TETANGGATUKU DONAT",
            "price": "Rp. 111.000",
            "img": "assets/images/product/kaus_kaki_donat.png"
          },
          {
            "name": "PULPEN TETANGGA TUKU",
            "price": "Rp. 14.000",
            "img": "assets/images/product/pulpen.png"
          },
          {
            "name": "PAYUNG HITAM LIPAT SABLON TUKU",
            "price": "Rp. 90.000",
            "img": "assets/images/product/payung.png"
          },
          {
            "name": "SEDOTAN STAINLESS TUKU",
            "price": "Rp. 22.000",
            "img": "assets/images/product/sedotan.png"
          },
          {
            "name": "JAS HUJAN TUKU",
            "price": "Rp. 55.000",
            "img": "assets/images/product/jas_hujan.png"
          },
          {
            "name": "TAS TETANGGA TUKU",
            "price": "Rp. 84.000",
            "img": "assets/images/product/tas_tetangga_tuku.png"
          },
        ];

        return LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final isMobile = width < 768;

            int crossAxisCount;
            int itemCount;

            if (width < 768) {
              crossAxisCount = 2;
              itemCount = products.length > 4 ? 4 : products.length;
            } else if (width < 1024) {
              crossAxisCount = 3;
              itemCount = products.length > 6 ? 6 : products.length;
            } else {
              crossAxisCount = 5;
              itemCount = products.length > 10 ? 10 : products.length;
            }

            return Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff4B5320),
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.cover,
                  opacity: 0.25,
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: isMobile ? 40 : 80,
                horizontal: isMobile ? 16 : 40,
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "PRODUK TOSERBAKU".tr,
                      textAlign: TextAlign.center,
                      style: _brewedCoffeeStyle(
                        fontSize: isMobile ? 28 : 42,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: itemCount,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: isMobile ? 12 : 20,
                      mainAxisSpacing: isMobile ? 12 : 20,
                      childAspectRatio: isMobile ? 0.65 : 0.72,
                    ),
                    itemBuilder: (context, index) {
                      final String rawName = products[index]["name"] ?? "";
                      final String price = products[index]["price"] ?? "";
                      final String img = products[index]["img"] ?? "";

                      return Container(
                        decoration: BoxDecoration(
                          color: const Color(0xffF3E9D7),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(2),
                                child: Image.asset(
                                  img,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    rawName.tr,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: _hanumanStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                      height: 1.2,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    price,
                                    style: _hanumanStyle(
                                      fontSize: 11,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => launchUrl(
                        Uri.parse(
                          'https://www.tokopedia.com/toko-kopi-tuku',
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3B2A22),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 20,
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      child: Text(
                        "LIHAT SELENGKAPNYA".tr,
                        style: _hanumanStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}