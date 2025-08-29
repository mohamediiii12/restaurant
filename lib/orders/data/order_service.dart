import 'dart:async';
import 'order_model.dart';

/// Fake in-memory service for demo purposes.
class OrderService {
  final List<Order> _orders = [
    Order(
      id: 'ORD-1001',
      dishName: 'Margherita Pizza',
      price: 175,
      status: OrderStatus.active,
      createdAt: DateTime.now().subtract(const Duration(minutes: 12)),
      imageAsset: null,
    ),
    Order(
      id: 'ORD-1002',
      dishName: 'Chicken Shawarma',
      price: 95,
      status: OrderStatus.completed,
      createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    Order(
      id: 'ORD-1003',
      dishName: 'Beef Burger',
      price: 120,
      status: OrderStatus.completed,
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
    ),
    Order(
      id: 'ORD-1004',
      dishName: 'Greek Salad',
      price: 70,
      status: OrderStatus.cancelled,
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      cancelledAt: DateTime.now().subtract(const Duration(days: 2, hours: 1)),
      cancelReason: 'Changed my mind',
    ),
  ];

  Future<List<Order>> fetchOrders() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _orders.map((o) => o).toList();
  }

  Future<Order> cancelOrder(String id, String reason) async {
    await Future.delayed(const Duration(milliseconds: 250));
    final idx = _orders.indexWhere((o) => o.id == id);
    if (idx == -1) throw Exception('Order not found');
    final order = _orders[idx];
    order.status = OrderStatus.cancelled;
    order.cancelReason = reason;
    order.cancelledAt = DateTime.now();
    return order;
  }

  Future<Order> reorder(String id) async {
    await Future.delayed(const Duration(milliseconds: 250));
    final src = _orders.firstWhere((o) => o.id == id);
    final newOrder = Order(
      id: 'ORD-${1000 + _orders.length + 1}',
      dishName: src.dishName,
      price: src.price,
      status: OrderStatus.active,
      createdAt: DateTime.now(),
      imageAsset: src.imageAsset,
    );
    _orders.insert(0, newOrder);
    return newOrder;
  }

  Future<Order> addReview(String id, int rating, String comment) async {
    await Future.delayed(const Duration(milliseconds: 200));
    final order = _orders.firstWhere((o) => o.id == id);
    order.rating = rating;
    order.reviewComment = comment;
    return order;
  }
}