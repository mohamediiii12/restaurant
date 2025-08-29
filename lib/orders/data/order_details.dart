// ملف: lib/models/order_details.dart

class OrderDetails {
  final String orderId;     // رقم الطلب
  final String productName; // اسم المنتج
  final int quantity;       // الكمية
  final double price;       // السعر الفردي
  final double total;       // السعر الكلي (quantity * price)

  OrderDetails({
    required this.orderId,
    required this.productName,
    required this.quantity,
    required this.price,
  }) : total = quantity * price;

  // لو هتتعامل مع JSON (مثلا من API أو Firebase)
  factory OrderDetails.fromJson(Map<String, dynamic> json) {
    return OrderDetails(
      orderId: json['orderId'],
      productName: json['productName'],
      quantity: json['quantity'],
      price: (json['price'] as num).toDouble(),
    );
  }

  get id => null;

  Map<String, dynamic> toJson() {
    return {
      'orderId': orderId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'total': total,
    };
  }
}
