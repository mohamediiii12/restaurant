class ProductModel {
  final String id;
  final String name;
  final String image;
  final double price;
  final bool bestSeller;

  ProductModel({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.bestSeller = false,
  });
}
