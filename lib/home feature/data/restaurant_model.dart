class Restaurant {
  final String id;
  final String name;
  final double rating;
  final String image;
  final String category;
  final String deliveryTime;

  const Restaurant({
    required this.id,
    required this.name,
    required this.rating,
    required this.image,
    required this.category,
    required this.deliveryTime,
  });

  factory Restaurant.fromJson(Map<String, dynamic> j) => Restaurant(
        id: j['id'].toString(),
        name: j['name'],
        rating: (j['rating'] as num).toDouble(),
        image: j['image'],
        category: j['category'],
        deliveryTime: j['deliveryTime'],
      );
}
