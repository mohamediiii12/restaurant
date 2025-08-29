import 'package:restaurant/orders/data/order_repositry.dart';

import '../data/order_model.dart';
import '../data/order_repositry.dart';
import '../data/order_service.dart';

class OrderController {
  // Singleton to share one instance across the app easily
  static final OrderController instance = OrderController(OrderRepository(OrderService()));

  final OrderRepository _repo;
  OrderController(this._repo);

  final List<Order> _orders = [];

  List<Order> get all => List.unmodifiable(_orders);
  List<Order> get active => _orders.where((o) => o.status == OrderStatus.active).toList();
  List<Order> get completed => _orders.where((o) => o.status == OrderStatus.completed).toList();
  List<Order> get cancelled => _orders.where((o) => o.status == OrderStatus.cancelled).toList();

  Future<void> load() async {
    _orders
      ..clear()
      ..addAll(await _repo.getAll());
  }

  Future<void> cancelOrder(String id, String reason) async {
    await _repo.cancel(id, reason);
  }

  Future<void> reorder(String id) async {
    await _repo.reorder(id);
  }

  Future<void> addReview(String id, int rating, String comment) async {
    await _repo.review(id, rating, comment);
  }
}