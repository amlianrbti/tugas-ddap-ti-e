import 'package:flutter/material.dart';
import '../../models/coffee.dart';
import '../../data/product_data.dart';
import '../../core/language_controller.dart';

class ProductSection extends StatefulWidget {
  const ProductSection({super.key});

  @override
  State<ProductSection> createState() => _ProductSectionState();
}

class _ProductSectionState extends State<ProductSection> {
  int selected = 0;
  final List<String> tabs = ["WHITE-MILK", "BLACK", "NON-COFFEE", "TUKUDAPAN"];
  final ScrollController _scrollController = ScrollController();

  TextStyle _hanumanStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
  }) {
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final current = (selected == 0)
        ? whiteMilkList
        : (selected == 1)
            ? blackList
            : (selected == 2)
                ? nonCoffeeList
                : tukudapanList;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return ValueListenableBuilder<AppLanguage>(
          valueListenable: LanguageController.language,
          builder: (context, lang, child) {
            return Container(
              color: const Color(0xffD6BFA6),
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                vertical: 40,
                horizontal: isMobile ? 16 : 40,
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "PILIHAN KOPI KESUKAAN ANDA".tr,
                          textAlign: TextAlign.center,
                          style: _brewedCoffeeStyle(
                            fontSize: isMobile ? 26 : 36,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "KOPI TUKU DIBUAT MENGGUNAKAN 100% BIJI KOPI ARABIKA"
                              .tr,
                          textAlign: TextAlign.center,
                          style: _hanumanStyle(
                            fontSize: isMobile ? 11 : 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 35),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 25,
                      runSpacing: 15,
                      children: List.generate(
                        tabs.length,
                        (i) {
                          final isActive = selected == i;
                          return GestureDetector(
                            onTap: () {
                              setState(() => selected = i);
                              if (_scrollController.hasClients) {
                                _scrollController.jumpTo(0);
                              }
                            },
                            child: Column(
                              children: [
                                Text(
                                  tabs[i].tr,
                                  style: _hanumanStyle(
                                    fontWeight: isActive
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: 14,
                                  ),
                                ),
                                if (isActive)
                                  Container(
                                    width: 40,
                                    height: 2,
                                    color: Colors.black,
                                    margin: const EdgeInsets.only(top: 4),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  isMobile
                      ? SizedBox(
                          height: 380,
                          child: PageView.builder(
                            controller: PageController(
                              viewportFraction: 0.52,
                            ),
                            itemCount: current.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: _buildProductCard(current[index]),
                              );
                            },
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios_new,
                                color: Colors.black54,
                                size: 20,
                              ),
                              onPressed: () {
                                if (_scrollController.hasClients) {
                                  _scrollController.animateTo(
                                    _scrollController.offset - 780,
                                    duration:
                                        const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: SizedBox(
                                height: 400,
                                child: ListView.builder(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: current.length,
                                  itemBuilder: (ctx, i) => Padding(
                                    padding:
                                        const EdgeInsets.only(right: 20),
                                    child: SizedBox(
                                      width: 240,
                                      child: _buildProductCard(current[i]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              icon: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black54,
                                size: 20,
                              ),
                              onPressed: () {
                                if (_scrollController.hasClients) {
                                  _scrollController.animateTo(
                                    _scrollController.offset + 780,
                                    duration:
                                        const Duration(milliseconds: 500),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildProductCard(Coffee item) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffF3E9D7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                item.image,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name.toUpperCase().tr,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: _hanumanStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.desc.tr,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: _hanumanStyle(
                      fontSize: 11.5,
                      color: Colors.black54,
                      height: 1.3,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black12,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Hot".tr,
                              style: _hanumanStyle(
                                fontSize: 11,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item.hot != "-" && item.hot.isNotEmpty
                                  ? "Rp ${item.hot}"
                                  : "-",
                              style: _hanumanStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 22,
                        color: Colors.black12,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              "Iced".tr,
                              style: _hanumanStyle(
                                fontSize: 11,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item.iced != "-" && item.iced.isNotEmpty
                                  ? "Rp ${item.iced}"
                                  : "-",
                              style: _hanumanStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}