import 'order_model.dart';
import 'order_service.dart';

class OrderRepository {
  final OrderService _service;
  OrderRepository(this._service);

  Future<List<Order>> getAll() => _service.fetchOrders();
  Future<Order> cancel(String id, String reason) => _service.cancelOrder(id, reason);
  Future<Order> reorder(String id) => _service.reorder(id);
  Future<Order> review(String id, int rating, String comment) => _service.addReview(id, rating, comment);
}