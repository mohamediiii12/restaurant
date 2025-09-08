class CartItem {
  final String id;
  final String name;
  final double price;
  final String imageUrl;
  
  int quantity;
  final DateTime addedAt;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.quantity = 1,
    DateTime? addedAt,
  }) : addedAt = addedAt ?? DateTime.now();

  double get totalPrice => price * quantity;
}
