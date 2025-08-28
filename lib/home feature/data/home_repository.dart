import 'restaurant_model.dart';

class HomeRepository {
  Future<List<String>> fetchCategories() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return const ['All', 'Pizza', 'Burgers', 'Sushi', 'Grill', 'Desserts'];
  }

  Future<List<Restaurant>> fetchRestaurants({String category = 'All'}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final data = [
      {
        'id': 1,
        'name': 'Pizza Hub',
        'rating': 4.6,
        'image': 'https://picsum.photos/seed/pizza/600/400',
        'category': 'Pizza',
        'deliveryTime': '25-35 min'
      },
      {
        'id': 2,
        'name': 'Burger Box',
        'rating': 4.4,
        'image': 'https://picsum.photos/seed/burger/600/400',
        'category': 'Burgers',
        'deliveryTime': '20-30 min'
      },
      {
        'id': 3,
        'name': 'Sushi Story',
        'rating': 4.7,
        'image': 'https://picsum.photos/seed/sushi/600/400',
        'category': 'Sushi',
        'deliveryTime': '30-40 min'
      },
    ];
    final list = data.map((e) => Restaurant.fromJson(e)).toList();
    if (category == 'All') return list;
    return list.where((r) => r.category == category).toList();
  }
}
