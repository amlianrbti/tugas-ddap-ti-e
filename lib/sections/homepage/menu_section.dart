import 'package:flutter/material.dart';
import '../../core/language_controller.dart';

class ProductModel {
  final String name;
  final String? desc;
  final String image;
  final String? hot;
  final String? iced;
  final String? harga;

  ProductModel({
    required this.name,
    this.desc,
    required this.image,
    this.hot,
    this.iced,
    this.harga,
  });
}

class MenuSection extends StatefulWidget {
  const MenuSection({super.key});

  @override
  State<MenuSection> createState() => _MenuSectionState();
}

class _MenuSectionState extends State<MenuSection> {
  int selected = 0;
  final ScrollController _scrollController = ScrollController();
  final tabs = ["WHITE-MILK", "BLACK", "NON-COFFEE", "TUKUDAPAN"];

  final List<ProductModel> whiteMilkList = [
    ProductModel(name: "Caramel", desc: "Espresso + Milk + Caramel Sauce", image: "assets/images/menu/whiteMilk/caramel.png", hot: "33.000", iced: "35.000"),
    ProductModel(name: "Cappucino", desc: "Espresso + Coffee Shot + Milk", image: "assets/images/menu/whiteMilk/cappucino.png", hot: "28.000", iced: "31.000"),
    ProductModel(name: "Latte", desc: "Espresso + Coffee Shot + Milk", image: "assets/images/menu/whiteMilk/latte.png", hot: "28.000", iced: "31.000"),
    ProductModel(name: "Mocha", desc: "Espresso + Chocolate + Sugar + Milk", image: "assets/images/menu/whiteMilk/mocha.png", hot: "33.000", iced: "35.000"),
    ProductModel(name: "Kopi Susu Tetangga", desc: "Espresso + Milk + Creamer + Arenga Sugar", image: "assets/images/menu/whiteMilk/kopi_susu_tetangga.png", hot: "23.000", iced: "25.000"),
    ProductModel(name: "Mini KST", desc: "Espresso + Milk + Creamer + Arenga Sugar", image: "assets/images/menu/whiteMilk/mini_kst.png", hot: "23.000", iced: "25.000"),
    ProductModel(name: "KST Nabati", desc: "Espresso + Oatmilk + Arenga Sugar", image: "assets/images/menu/whiteMilk/kst_nabati.png", hot: "23.000", iced: "25.000"),
  ];

  final List<ProductModel> blackList = [
    ProductModel(name: "Kopi Hitam Tetangga", desc: "Double Shot of Tetangga Blend + Water", image: "assets/images/menu/black/coming_soon.png", hot: "18.000", iced: "20.000"),
    ProductModel(name: "Espresso", desc: "Double Shot of Tetangga Blend", image: "assets/images/menu/black/coming_soon.png", hot: "18.000", iced: "-"),
    ProductModel(name: "Long Black", desc: "Double Shot of Tetangga Blend + Coffee Shot + Water", image: "assets/images/menu/black/coming_soon.png", hot: "25.000", iced: "28.000"),
    ProductModel(name: "Filter Pagi", desc: "80% Washed 20% Natural Hint of Chocolate Hand Brewed with Hot Water", image: "assets/images/menu/black/coming_soon.png", hot: "22.000", iced: "-"),
    ProductModel(name: "Cold Drip Pagi", desc: "80% Washed 20% Natural Hint of Chocolate Four Hours Slow Brewed with Room Temperature Water", image: "assets/images/menu/black/coming_soon.png", hot: "-", iced: "22.000"),
    ProductModel(name: "Filter Sore", desc: "50% Washed 50% Natural Hint of Fruits Hand Brewed with Hot Water", image: "assets/images/menu/black/coming_soon.png", hot: "25.000", iced: "-"),
    ProductModel(name: "Cold Drip Sore", desc: "50% Washed 50% Natural Hint of Fruits Four Hours Slow Brewed with Room Temperature Water", image: "assets/images/menu/black/coming_soon.png", hot: "-", iced: "25.000"),
    ProductModel(name: "Cold Drip Santai", desc: "Coffee Shot + Santai Series Kelapa Jeruk/Remon", image: "assets/images/menu/black/coming_soon.png", hot: "-", iced: "30.000"),
  ];

  final List<ProductModel> nonCoffeeList = [
    ProductModel(name: "Chocolate", desc: "Chocolate + Milk + Sugar", image: "assets/images/menu/nonCoffee/coming_soon.png", hot: "30.000", iced: "30.000"),
    ProductModel(name: "Earl Grey Milk Tea", desc: "Earl Grey Tea + Milk + Milk Tea Powder + Creamer", image: "assets/images/menu/nonCoffee/coming_soon.png", hot: "28.000", iced: "28.000"),
    ProductModel(name: "Teh Jawa", desc: "Java Tea + Pandan Sugar", image: "assets/images/menu/nonCoffee/coming_soon.png", hot: "20.000", iced: "23.000"),
    ProductModel(name: "Remon", desc: "Java Tea + Lemongrass + Sugar + Lemon + Lime", image: "assets/images/menu/nonCoffee/coming_soon.png", hot: "23.000", iced: "25.000"),
    ProductModel(name: "Kelapa Jeruk", desc: "Coconut Water + Orange Juice + Lime", image: "assets/images/menu/nonCoffee/coming_soon.png", hot: "23.000", iced: "25.000"),
    ProductModel(name: "Go-Es", desc: "Coconut Water + Honey + Lime", image: "assets/images/menu/nonCoffee/coming_soon.png", hot: "23.000", iced: "25.000"),
    ProductModel(name: "SKMJ", desc: "Coconut Milk + Ginger + Honey + Andaliman + Arenga Sugar", image: "assets/images/menu/nonCoffee/coming_soon.png", hot: "23.000", iced: "25.000"),
    ProductModel(name: "Susu Aren", desc: "Milk + Arenga Sugar", image: "assets/images/menu/nonCoffee/coming_soon.png", hot: "18.000", iced: "18.000"),
  ];

  final List<ProductModel> tukudapanList = [
    ProductModel(name: "Donat Kampoeng", desc: "Donat lembut dengan taburan gula halus", image: "assets/images/menu/tukudapan/coming_soon.png", harga: "7.000"),
    ProductModel(name: "Donat Cokelat", desc: "Donat dengan Isian Cokelat", image: "assets/images/menu/tukudapan/coming_soon.png", harga: "10.000"),
    ProductModel(name: "Bolu", desc: "Wortel/Coklat/Aren/Piscok", image: "assets/images/menu/tukudapan/coming_soon.png", harga: "12.000"),
    ProductModel(name: "Kukis Oatmeal", desc: "Kukis oatmeal gurih dan renyah.", image: "assets/images/menu/tukudapan/coming_soon.png", harga: "13.000"),
    ProductModel(name: "Onigiri", desc: "Tuna/Salmon Mayo/Cakalang", image: "assets/images/menu/tukudapan/coming_soon.png", harga: "15.000"),
  ];

  void _scroll(bool goRight) {
    double speed = 264.0;
    double target = goRight
        ? _scrollController.offset + speed
        : _scrollController.offset - speed;

    _scrollController.animateTo(
      target.clamp(
        0.0,
        _scrollController.position.maxScrollExtent,
      ),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  TextStyle _hanumanStyle({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: "Hanuman",
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Colors.black,
      letterSpacing: letterSpacing,
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
    final isMobile = MediaQuery.of(context).size.width < 768;
    final current =
        (selected == 0)
            ? whiteMilkList
            : (selected == 1)
                ? blackList
                : (selected == 2)
                    ? nonCoffeeList
                    : tukudapanList;

    return ValueListenableBuilder<AppLanguage>(
      valueListenable: LanguageController.language,
      builder: (context, lang, child) {
        return Container(
          color: const Color(0xffD6BFA6),
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 40 : 60,
          ),
          child: Column(
            children: [
              Text(
                "PILIHAN KOPI KESUKAAN ANDA".tr,
                textAlign: TextAlign.center,
                style: _brewedCoffeeStyle(
                  fontSize: isMobile ? 24 : 36,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                "KOPI TUKU DIBUAT MENGGUNAKAN 100% BIJI KOPI ARABIKA".tr,
                textAlign: TextAlign.center,
                style: _hanumanStyle(
                  fontSize: isMobile ? 11 : 13,
                  color: Colors.black,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 32),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 40,
                children: List.generate(tabs.length, (i) {
                  final isActive = selected == i;
                  return GestureDetector(
                    onTap: () {
                      setState(() => selected = i);
                      if (_scrollController.hasClients) {
                        _scrollController.jumpTo(0.0);
                      }
                    },
                    child: Column(
                      children: [
                        Text(
                          tabs[i].tr,
                          style: _hanumanStyle(
                            fontWeight:
                                isActive
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 2),
                        if (isActive)
                          Container(
                            width: 40,
                            height: 1.5,
                            color: Colors.black,
                          ),
                      ],
                    ),
                  );
                }),
              ),

              const SizedBox(height: 32),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    if (!isMobile)
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () => _scroll(false),
                      ),

                    Expanded(
                      child: SizedBox(
                        height: 350,
                        child: ListView.builder(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: current.length,
                          itemBuilder: (context, index) {
                            final item = current[index];

                            return Container(
                              width: 240,
                              margin: const EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color(0xffF3E9D7),
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.asset(
                                      item.image,
                                      height: 160,
                                      width: 208,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    item.name.toUpperCase().tr,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: _hanumanStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Expanded(
                                    child: Text(
                                      (item.desc ?? "").tr,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: _hanumanStyle(fontSize: 12),
                                    ),
                                  ),
                                  const Divider(
                                    color: Colors.black,
                                    thickness: 1,
                                    height: 20,
                                  ),

                                  item.harga != null
                                      ? Center(
                                        child: Text(
                                          "Rp ${item.harga}",
                                          style: _hanumanStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      )
                                      : Column(
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    "Hot".tr,
                                                    style: _hanumanStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const Text(" | "),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    "Iced".tr,
                                                    style: _hanumanStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 1),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    (item.hot == null ||  item.hot == "-" ||  item.hot!.isEmpty)  ? "-"  : "Rp ${item.hot}",
                                                    style: _hanumanStyle(
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const Text(" | "),
                                              Expanded(
                                                child: Center(
                                                  child: Text(
                                                    (item.iced == null || item.iced == "-" || item.iced!.isEmpty)  ? "-"  : "Rp ${item.iced}",
                                                    style: _hanumanStyle(
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),

                    if (!isMobile)
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed: () => _scroll(true),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}