class ItemModel {
  final int itemID;
  final String itemName;
  final double itemPrice;
  final String imageUrl;

  ItemModel({
    required this.itemID,
    required this.itemName,
    required this.itemPrice,
    required this.imageUrl,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      itemID: json['itemID'],
      itemName: json['itemName'],
      itemPrice: (json['itemPrice'] as num).toDouble(),
      imageUrl: json['imageUrl'] ?? 'https://via.placeholder.com/150',
    );
  }
}