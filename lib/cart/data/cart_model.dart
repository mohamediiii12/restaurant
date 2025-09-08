import 'cart_item.dart';

class CartModel {
  final List<CartItem> items;

  CartModel({this.items = const []});

  double get subtotal => items.fold(0, (sum, item) => sum + item.totalPrice);
  double get tax => subtotal * 0.15; // مثال
  double get delivery => 3.0;
  double get total => subtotal + tax + delivery;

  bool get isEmpty => items.isEmpty;
  int get itemCount => items.length;
}
