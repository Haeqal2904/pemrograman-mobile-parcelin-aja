import 'package:flutter/material.dart';

void main() {
  runApp(const SerahSerahanApp());
}

class SerahSerahanApp extends StatelessWidget {
  const SerahSerahanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Serah Serahan',
      theme: ThemeData(
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFFDF9FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF9B4D78),
        ),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  final List<Widget> pages = const [
    HomePage(),
    CartPage(),
    RankingPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: pages[selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFF1F1F1),
        selectedItemColor: const Color(0xFFE94B2F),
        unselectedItemColor: Colors.grey,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.stars_outlined),
            activeIcon: Icon(Icons.stars),
            label: 'Ringkas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            activeIcon: Icon(Icons.history),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// =====================================================
// HOME PAGE
// =====================================================

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF9FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Text(
                  '🌤️',
                  style: TextStyle(fontSize: 28),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      '9:41',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Hai, Fery',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 5),

          // SEARCH
          _searchBar(),

          const SizedBox(height: 5),

          // PICKUP DELIVERY
          Row(
            children: [
              const Text(
                'Melayani',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              _radioText('Pickup', true),
              const SizedBox(width: 10),
              _radioText('Delivery', false),
            ],
          ),

          const SizedBox(height: 8),

          // BANNER
          Container(
            height: 110,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFE9CFC0),
                  Color(0xFFD7BBA5),
                ],
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 5,
                  bottom: 0,
                  child: const Text(
                    '🎁\n🎀',
                    style: TextStyle(fontSize: 55),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'PAKET SESERAHAN & PERSIAPAN',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const Text(
                        'PERNIKAHAN PREMIUM',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 3),
                      const SizedBox(
                        width: 175,
                        child: Text(
                          'Pilihan terbaik untuk seserahan, mahar, cincin, souvenir, dan hampers pernikahan Anda.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 7,
                          ),
                        ),
                      ),
                      const SizedBox(height: 7),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFB64029),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          'PESAN SEKARANG',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 6,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // CATEGORY
          SizedBox(
            height: 65,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CategoryItem(title: 'Seserahan'),
                CategoryItem(title: 'Hampers'),
                CategoryItem(title: 'Mahar'),
                CategoryItem(title: 'Kotak Cincin'),
                CategoryItem(title: 'Souvenir'),
              ],
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Promo Bulan Ini',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          // PROMO
          Row(
            children: [
              Expanded(
                child: ProductCard(
                  name: 'Seserahan Pernikahan Aesthetic',
                  price: 'Rp 150.000',
                  icon: '🎁',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ProductCard(
                  name: 'Hampers',
                  price: 'Rp 350.000',
                  icon: '🎀',
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          const Text(
            'Pilih barang',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 7),

          // PILIH BARANG
          SizedBox(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                SmallProduct(icon: '🧴', title: 'Facial wash'),
                SmallProduct(icon: '🧴', title: 'Body lotion'),
                SmallProduct(icon: '🧎', title: 'Alat sholat'),
                SmallProduct(icon: '💍', title: 'Cincin'),
                SmallProduct(icon: '💐', title: 'Bunga segar'),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // STUDIO RANGKAIAN
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '🖌️ STUDIO RANGKAIAN INTERAKTIF',
                  style: TextStyle(
                    color: Color(0xFF9B4D78),
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Buat Parcel Impianmu',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 3),
                const Text(
                  'Susun sendiri isi seserahan, pilih kotak & dekorasi',
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.grey,
                  ),
                ),
                const Text(
                  'dalam 3 menit.',
                  style: TextStyle(
                    fontSize: 9,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 7),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF9B4D78),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 7,
                      ),
                    ),
                    child: const Text(
                      'Mulai rangkai →',
                      style: TextStyle(fontSize: 9),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// =====================================================
// HISTORY PAGE
// =====================================================

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF9FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                const Text(
                  '🌤️',
                  style: TextStyle(fontSize: 28),
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      '9:41',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Hai, Fery',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 5),

          // SEARCH
          _searchBar(),

          const SizedBox(height: 5),

          // PICKUP DELIVERY
          Row(
            children: [
              const Text(
                'Melayani',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              _radioText('Pickup', true),
              const SizedBox(width: 10),
              _radioText('Delivery', false),
            ],
          ),

          const SizedBox(height: 8),

          // TITLE
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFF9E9F8),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Center(
              child: Text(
                'Order History',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // HISTORY ITEMS
          const HistoryItem(
            image: '🧴',
            name: 'Body lotion CHANEL 200ml',
            price: 'Rp 250.000',
            date: '29/09/2026',
          ),

          const HistoryItem(
            image: '🧴',
            name: 'Facial Wash COSRX 150ml',
            price: 'Rp 110.000',
            date: '21/06/2026',
          ),

          const HistoryItem(
            image: '🧎',
            name: 'Alat Sholat Lengkap',
            price: 'Rp 350.000',
            date: '15/04/2026',
          ),

          const HistoryItem(
            image: '💍',
            name: 'Cincin Nikah',
            price: 'Rp 3.000.000',
            date: '10/03/2026',
          ),
        ],
      ),
    );
  }
}

// =====================================================
// HISTORY ITEM
// =====================================================

class HistoryItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final String date;

  const HistoryItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF7FC),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 58,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                image,
                style: const TextStyle(fontSize: 28),
              ),
            ),
          ),

          const SizedBox(width: 8),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF9B4D78),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 7),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFFB77C9F),
                    fontSize: 10,
                  ),
                ),
                const SizedBox(height: 5),

                Row(
                  children: [
                    _star(),
                    _star(),
                    _star(),
                    _star(),
                    _star(),
                  ],
                ),
              ],
            ),
          ),

          Text(
            date,
            style: const TextStyle(
              fontSize: 6,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _star() {
    return Container(
      margin: const EdgeInsets.only(right: 1),
      color: const Color(0xFF9B4D78),
      child: const Icon(
        Icons.star,
        color: Colors.white,
        size: 12,
      ),
    );
  }
}

// =====================================================
// COMPONENT HOME
// =====================================================

class CategoryItem extends StatelessWidget {
  final String title;

  const CategoryItem({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      margin: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(9),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 4,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(9),
              child: Image.asset(
                'assets/images/tes_foto.png',
                width: 45,
                height: 45,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            style: const TextStyle(fontSize: 7),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String icon;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color(0xFFE7D6E4),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 8,
                    color: Color(0xFF9B4D78),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFF9B4D78),
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Beli',
                    style: TextStyle(
                      fontSize: 7,
                      color: Color(0xFF9B4D78),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            icon,
            style: const TextStyle(fontSize: 35),
          ),
        ],
      ),
    );
  }
}

class SmallProduct extends StatelessWidget {
  final String icon;
  final String title;

  const SmallProduct({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      margin: const EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            icon,
            style: const TextStyle(fontSize: 25),
          ),
          const SizedBox(height: 3),
          Text(
            title,
            style: const TextStyle(fontSize: 6),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// =====================================================
// SEARCH
// =====================================================

Widget _searchBar() {
  return Container(
    height: 30,
    padding: const EdgeInsets.symmetric(horizontal: 10),
    decoration: BoxDecoration(
      color: const Color(0xFFEFEDEF),
      borderRadius: BorderRadius.circular(15),
    ),
    child: const Row(
      children: [
        Icon(
          Icons.search,
          size: 15,
          color: Colors.grey,
        ),
        SizedBox(width: 5),
        Text(
          'Cari vendor seserahan, souvenir, parcel dan lain lain',
          style: TextStyle(
            fontSize: 7,
            color: Colors.grey,
          ),
        ),
      ],
    ),
  );
}

Widget _radioText(String text, bool active) {
  return Row(
    children: [
      Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: const Color(0xFFB14E8C),
            width: 1.5,
          ),
          color: active
              ? const Color(0xFFE5B4D6)
              : Colors.transparent,
        ),
      ),
      const SizedBox(width: 3),
      Text(
        text,
        style: const TextStyle(
          fontSize: 8,
          color: Colors.black87,
        ),
      ),
    ],
  );
}

// =====================================================
// HALAMAN SEMENTARA
// =====================================================

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Cart Page'),
    );
  }
}

class RankingPage extends StatelessWidget {
  const RankingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Ranking Page'),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Profile Page'),
    );
  }
}