import '../data/cart_item.dart';

class CartController {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(CartItem item) {
    _items.add(item);
  }

  void removeItem(CartItem item) {
    _items.remove(item);
  }

  void increaseQuantity(CartItem item) {
    item.quantity++;
  }

  void decreaseQuantity(CartItem item) {
    if (item.quantity > 1) {
      item.quantity--;
    }
  }

  double get totalAmount {
    return _items.fold(0, (sum, item) => sum + item.totalPrice);
  }
}
