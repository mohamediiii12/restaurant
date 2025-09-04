import 'package:flutter/material.dart';
import 'widgets/product_card.dart';
import '../data/product_model.dart';

// استدعاء الشاشات
import 'package:restaurant/profile/view/profile_screen.dart';
import 'package:restaurant/search/view/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // 🔑 مفتاح علشان نقدر نغير التاب من أي مكان في الأبلكيشن
  static final GlobalKey<_HomeScreenState> homeKey =
      GlobalKey<_HomeScreenState>();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // الصفحات اللي هتنقل بينهم
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomeContent(),
      const ProfileScreen(),
      SearchScreen(),
    ];
  }

  void changeTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: HomeScreen.homeKey,
      body: IndexedStack(
        // ✅ يحافظ على حالة كل شاشة
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: changeTab,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ProductModel> bestSellers = [
      ProductModel(
          id: "1",
          name: "Cake",
          image: "https://picsum.photos/200/300?1",
          price: 10,
          bestSeller: true),
      ProductModel(
          id: "2",
          name: "Pizza",
          image: "https://picsum.photos/200/300?2",
          price: 12,
          bestSeller: true),
      ProductModel(
          id: "3",
          name: "Salad",
          image: "https://picsum.photos/200/300?3",
          price: 8,
          bestSeller: true),
    ];

    final List<ProductModel> recommended = [
      ProductModel(
          id: "4",
          name: "Burger",
          image: "https://picsum.photos/200/300?4",
          price: 9),
      ProductModel(
          id: "5",
          name: "Spring Rolls",
          image: "https://picsum.photos/200/300?5",
          price: 7),
    ];

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search bar
            TextField(
              decoration: InputDecoration(
                hintText: "Search",
                prefixIcon: const Icon(Icons.search),
                fillColor: const Color(0xFFFFF3CD),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // 🌞 Good Morning
            const Text(
              "Good Morning",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
            const Text(
              "Rise And Shine! It’s Breakfast Time",
              style: TextStyle(color: Colors.black54),
            ),
            const SizedBox(height: 20),

            // 🍽️ Categories
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryChip(label: "Snacks", icon: Icons.fastfood),
                  CategoryChip(label: "Meal", icon: Icons.rice_bowl),
                  CategoryChip(label: "Vegan", icon: Icons.eco),
                  CategoryChip(label: "Dessert", icon: Icons.cake),
                  CategoryChip(label: "Drinks", icon: Icons.local_drink),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 🛒 Best Seller
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Best Seller",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("View All",
                    style: TextStyle(color: Colors.orange, fontSize: 14)),
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: bestSellers.length,
                itemBuilder: (context, index) =>
                    ProductCard(product: bestSellers[index]),
              ),
            ),
            const SizedBox(height: 20),

            // 🎉 Discount Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "Experience our delicious new dish\n30% OFF",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            // 🍔 Recommended
            const Text("Recommend",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            SizedBox(
              height: 190,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: recommended.length,
                itemBuilder: (context, index) =>
                    ProductCard(product: recommended[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryChip extends StatelessWidget {
  final String label;
  final IconData icon;
  const CategoryChip({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3CD),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.orange, size: 28),
          const SizedBox(height: 6),
          Text(label,
              style: const TextStyle(fontSize: 14, color: Colors.black)),
        ],
      ),
    );
  }
}
