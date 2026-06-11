import 'package:flutter/material.dart';

enum AppLanguage { id, en }

class LanguageController {
  static final ValueNotifier<AppLanguage> language =
      ValueNotifier<AppLanguage>(AppLanguage.id);

  static bool get isEN => language.value == AppLanguage.en;

  static void toggle() {
    language.value =
        language.value == AppLanguage.id
            ? AppLanguage.en
            : AppLanguage.id;
  }

  static const Map<String, String> _englishDictionary = {
    'SURAT KABAR\nTUKU': 'TUKU\nNEWSPAPER',

    'DAPATKAN CERITA BAGAIMANA TUKU MENJAGA\nKUALITAS SETIAP PRODUKNYA DAN MEMBERIKAN\nGERAKAN BERDAMPAK.':
    'GET THE STORY OF HOW TUKU MAINTAINS THE\nQUALITY OF EACH PRODUCT AND PROVIDES AN\nIMPACTFUL MOVEMENT.',

    'PRODUK YANG KONSISTEN': 'CONSISTENT PRODUCTS',

    'BERTETANGGA BAIK': 'GOOD NEIGHBORS',

    'MENJUNJUNG KEBERLANJUTAN' : 'UPHOLD SUSTAINABILITY',

    'TUTUP': 'CLOSE',

    'TENTANG': 'ABOUT',

    'LOKASI': 'LOCATION',

    'SENYUM, SALAM, SAPA': 'SMILE, GREET, SPEAK',

    'Budaya dari seluruh lapisan struktur keluarga TUKU. Sebuah upaya untuk mengenal, memahami, dan mendengarkan tetangga.':
    'The culture of all levels of the TUKU family structure. An effort to know, understand, and listen to neighbors.',

    'KUMPUL KELUARGA TUKU': 'TUKU FAMILY GATHERING',

    'Berkegiatan bersama tetangga. Kadang untuk perayaan, kadang hanya untuk bersenda-gurau, yang penting bisa berkumpul.':
    'Activities with neighbors. Sometimes for celebration, sometimes just for fun, the important thing is to be together.',

    'KARTU RUKUN TETANGGA': 'NEIGHBORHOOD CARD',

    'Kalau negara punya TKR, TUKU punya KaRT. Sebuah tanda eratnya pertetangan. Belajar bersama, membuat gerakan bersama juga.':
    'If the country has TKR, TUKU has KaRT. A sign of close neighborhood ties. Learning together, creating movements together too.',

    'SPESIALISASI PRODUK': 'PRODUCT SPECIALIZATION',

    'EKSPLORASI': 'EXPLORATION',

    'RISET BAHAN BERKUALITAS': 'QUALITY INGREDIENT RESEARCH',

    'INOVASI RASA BERKELANJUTAN': 'SUSTAINABLE FLAVOR INNOVATION',

    'NYAMAN DI LIDAH, NYAMAN DI HATI': 'PLEASANT TO THE PALATE, COMFORT TO THE HEART',

    'KESEIMBANGAN\nPRODUK': 'PRODUCT\nBALANCE',

    'KONSISTENSI': 'CONSISTENCY',

    'KUALITAS TERJAGA': 'MAINTAINED QUALITY',

    'PENYAJIAN KONSISTEN': 'CONSISTENT SERVICE',

    'DAPAT DIANDALKAN': 'RELIABLE',

    'BACA SELENGKAPNYA': 'READ MORE',

    'COMING SOON': 'COMING SOON',

    'SURAT KABAR': 'NEWSLETTER',

    'GALERI': 'GALLERY',

    'KEMBALI KE GALERI': 'BACK TO GALLERY',

    'FOLLOW US!': 'FOLLOW US!',

    'PILIHAN KOPI KESUKAAN ANDA': 'YOUR FAVORITE COFFEE CHOICES',

    'KOPI TUKU DIBUAT MENGGUNAKAN 100% BIJI KOPI ARABIKA':

    'TUKU COFFEE IS MADE USING 100% ARABICA COFFEE BEANS',

    'WHITE-MILK': 'WHITE MILK',

    'BLACK': 'BLACK',

    'NON-COFFEE': 'NON-COFFEE',

    'TUKUDAPAN': 'TUKUDAPAN',

    'HOT': 'HOT',

    'ICED': 'ICED',

    'Espresso + Milk + Caramel Sauce':
    'Espresso + Milk + Caramel Sauce',

    'Espresso + Coffee Shot + Milk':
    'Espresso + Coffee Shot + Milk',

    'Espresso + Chocolate + Sugar + Milk':
    'Espresso + Chocolate + Sugar + Milk',

    'Espresso + Milk + Creamer + Arenga Sugar':
    'Espresso + Milk + Creamer + Palm Sugar',

    'Espresso + Oatmilk + Arenga Sugar':
    'Espresso + Oat Milk + Palm Sugar',

    'Double Shot of Tetangga Blend + Water':
    'Double Shot of Tetangga Blend + Water',

    'Double Shot of Tetangga Blend':
    'Double Shot of Tetangga Blend',

    'Double Shot of Tetangga Blend + Coffee Shot + Water':
    'Double Shot of Tetangga Blend + Coffee Shot + Water',

    '80% Washed 20% Natural Hint of Chocolate Hand Brewed with Hot Water':
    '80% Washed, 20% Natural Chocolate Notes. Hand Brewed with Hot Water',

    '80% Washed 20% Natural Hint of Chocolate Four Hours Slow Brewed with Room Temperature Water':
    '80% Washed, 20% Natural Chocolate Notes. Slow Brewed for Four Hours with Room Temperature Water',

    '50% Washed 50% Natural Hint of Fruits Hand Brewed with Hot Water':
    '50% Washed, 50% Natural Fruity Notes. Hand Brewed with Hot Water',

    '50% Washed 50% Natural Hint of Fruits Four Hours Slow Brewed with Room Temperature Water':
    '50% Washed, 50% Natural Fruity Notes. Slow Brewed for Four Hours with Room Temperature Water',

    'Coffee Shot + Santai Series Kelapa Jeruk/Remon':
    'Coffee Shot + Santai Series Coconut Orange/Remon',

    'Chocolate + Milk + Sugar':
    'Chocolate + Milk + Sugar',

    'Earl Grey Tea + Milk + Milk Tea Powder + Creamer':
    'Earl Grey Tea + Milk + Milk Tea Powder + Creamer',

    'Java Tea + Pandan Sugar':
    'Java Tea + Pandan Sugar',

    'Java Tea + Lemongrass + Sugar + Lemon + Lime':
    'Java Tea + Lemongrass + Sugar + Lemon + Lime',

    'Coconut Water + Orange Juice + Lime':
    'Coconut Water + Orange Juice + Lime',

    'Coconut Water + Honey + Lime':
    'Coconut Water + Honey + Lime',

    'Coconut Milk + Ginger + Honey + Andaliman + Arenga Sugar':
    'Coconut Milk + Ginger + Honey + Andaliman + Palm Sugar',

    'Milk + Arenga Sugar':
    'Milk + Palm Sugar',

    'Donat lembut dengan taburan gula halus':
    'Soft donut with powdered sugar topping',

    'Donat dengan Isian Cokelat':
    'Donut with Chocolate Filling',

    'Wortel/Coklat/Aren/Piscok':
    'Carrot/Chocolate/Palm Sugar/Banana Chocolate',

    'Kukis oatmeal gurih dan renyah.':
    'Crunchy savory oatmeal cookies',

    'Tuna/Salmon Mayo/Cakalang':
    'Tuna/Salmon Mayo/Skipjack Tuna',

    'PRODUK TOSERBAKU': 'TOSERBAKU PRODUCTS',

    'LIHAT SELENGKAPNYA': 'VIEW MORE',

    'BOTOL MINUM TETANGGA TUKU DONAT':
    'TUKU DONUT NEIGHBOR WATER BOTTLE',

    'MUKENA TRAVEL':
    'TRAVEL PRAYER GARMENT',

    'TAS TERPAL TUKU':
    'TUKU TARPAULIN BAG',

    'KAOS KAKI #TETANGGATUKU KECIL':
    '#TETANGGATUKU SMALL SOCKS',

    'KAUS KAKI #TETANGGATUKU DONAT':
    '#TETANGGATUKU DONUT SOCKS',

    'PULPEN TETANGGA TUKU':
    'TUKU NEIGHBOR PEN',

    'PAYUNG HITAM LIPAT SABLON TUKU':
    'TUKU PRINTED FOLDING BLACK UMBRELLA',

    'SEDOTAN STAINLESS TUKU':
    'TUKU STAINLESS STRAW',

    'JAS HUJAN TUKU':
    'TUKU RAINCOAT',

    'TAS TETANGGA TUKU':
    'TUKU NEIGHBOR BAG',

    'Digerakan oleh semangat riset dan pengembangan dari hasil bumi Indonesia untuk menghadirkan produk yang nyaman di lidah dan nyaman di hati.':
    'Driven by a spirit of research and development of Indonesian agricultural products to create offerings that are pleasant to the palate and comforting to the heart.',

    'Stabilitas pada kualitas rasa dan kecepatan penyajian demi menjaga posisi TUKU sebagai pilihan yang dapat diandalkan tetangga.':
    'Consistency in taste quality and service speed to maintain TUKU as a reliable choice for the neighborhood.',

    'Menikmati manisnya, pahitnya, hangatnya, sejuknya, rukun bertetangga.':
    'Enjoying the sweetness, bitterness, warmth, and freshness of living harmoniously as neighbors.',

    'MEMBUAT GERAKAN': 'CREATING MOVEMENT',

    'MEMBAWA DAMPAK': 'MAKING AN IMPACT',

    'Waste Management\nCommunity Empowerment\nRecycle & Upcycle.':
    'Waste Management\nCommunity Empowerment\nRecycle & Upcycle.',

    'Responsible Sourcing\nCommunity Organizing\nReforestation.':
    'Responsible Sourcing\nCommunity Organizing\nReforestation.',

    'Satu langkah kecil hari ini untuk beribu cerita baik di kemudian hari.':
    'One small step today for thousands of good stories in the future.',

    'DAFTAR BERITA': 'NEWS LIST',

    'MULAI HARI ATAU TUTUP HARI, ADA COLD DRIP PAGI DAN SORE':
    'START OR END YOUR DAY WITH COLD DRIP PAGI AND SORE',

    'Memulai hari dengan segelas kopi menjadi satu hal yang tidak terlewatkan. Ketika tubuh dan pikiran membutuhkan kesegaran rukun bertetangga...':
    'Starting the day with a cup of coffee is something not to be missed. When body and mind need the refreshing spirit of togetherness...',

    'MENGENAL PROSES PASCA PANEN BIJI KOPI TETANGGA':
    'UNDERSTANDING THE POST-HARVEST PROCESS OF TETANGGA COFFEE BEANS',

    'Melihat lebih dekat perjalanan biji kopi lokal hasil dedikasi para petani nusantara, dirawat dengan konsistensi penuh untuk menjaga cita rasa otentik...':
    'A closer look at the journey of locally grown coffee beans, cultivated by dedicated Indonesian farmers and carefully maintained to preserve their authentic flavor...',

    'CERITA DI BALIK HANGATNYA RUANG KUMPUL TETANGGA':
    'THE STORY BEHIND THE WARMTH OF THE NEIGHBORHOOD GATHERING SPACE',

    'Bukan sekadar tempat singgah, TUKU hadir membangun ruang interaksi yang erat. Setiap sudut menyimpan cerita hangat tentang kebersamaan kita...':
    'More than just a stopover, TUKU creates a place for meaningful interaction. Every corner holds warm stories of togetherness...',

    'TELUSURI BERITA SELENGKAPNYA':
    'EXPLORE MORE NEWS',

    'Lahir karena mimpi, besar karena tetangga.':
    'Born from a dream, grown by neighbors.',

    '"Lahir karena mimpi, besar karena tetangga."':
    '"Born from a dream, grown by neighbors."',

    'Berangan • Berkarya • Bertumbuh':
    'Dream • Create • Thrive',

    'BERSAMA TUKU':
    'TOGETHER WITH TUKU',

    'KEGIATAN': 'ACTIVITIES',

    'TOKO': 'STORE',

    'ULANG TAHUN KE-9': '9TH ANNIVERSARY',

    'Merayakan perjalanan bersama tetangga Tuku selama sembilan tahun.':
    'Celebrating nine years of journey together with Tuku neighbors.',

    'MENGUNJUNGI TETANGGA TUKU':
    'VISITING TUKU NEIGHBORS',

    'Bertamu ke Bandung':
    'Visiting Bandung',

    'SAPA BARISTA LAMA DI TUKU CIPETE':
    'MEET THE ORIGINAL BARISTAS AT TUKU CIPETE',

    'Nostalgia rasa dan sapaan hangat dari barista legendaris kami.':
    'Nostalgic flavors and warm greetings from our legendary baristas.',

    'ULANG TAHUN TOSERBAKU':
    'TOSERBAKU ANNIVERSARY',

    'Perayaan hari jadi toko serba ada Kopi Tuku dengan promo dan produk kurasi khusus.':
    'Celebrating the anniversary of Tuku’s general store with special promotions and curated products.',

    'KUMPUL TETANGGA TUKU KECIL':
    'TUKU LITTLE NEIGHBORS GATHERING',

    'Momen kebersamaan dan ruang belajar kreatif bersama anak-anak tetangga Tuku.':
    'A moment of togetherness and creative learning with Tuku neighborhood children.',

    'JELAJAH CIPETE':
    'EXPLORE CIPETE',

    'Menyusuri gang-gang hangat dan kedai bersejarah tempat lahirnya Kopi Tuku.':
    'Exploring the warm alleys and historic shops where Kopi Tuku was born.',

    'CARI TOKO TUKU SEKITAR MU!':
    'FIND A TUKU STORE NEAR YOU!',

    'INFORMASI LAYANAN':
    'SERVICE INFORMATION',

    'Hubungi Kami:':
    'Contact Us:',

    'Informasi Umum:':
    'General Information:',

    'Event & Pojok Tuku:':
    'Events & Tuku Corner:',

    'Halaman sedang dalam masa pengembangan.':
    'This page is currently under development.',

    'Tentang':
    'About',

    'Produk':
    'Products',

    'Lokasi Toko':
    'Store Locations',

    'Surat Kabar':
    'Newspaper',

    'Galeri':
    'Gallery',

    '© 2026 PT KARYA TETANGGA TUKU. ALL RIGHT RESERVED.':
    '© 2026 PT KARYA TETANGGA TUKU. ALL RIGHTS RESERVED.',

    'INFO TUKU' : 'TUKU INFORMATION',
  };

  static bool get isId => !isEN;

  static String translate(String text) {
  if (!isEN) return text;

  return _englishDictionary[text.trim()] ?? text;
  }
}

extension TranslatableString on String {
  String get tr => LanguageController.translate(this);
}