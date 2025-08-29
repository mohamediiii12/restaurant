import 'package:flutter/material.dart';
import '../data/order_model.dart';

class OrderTile extends StatelessWidget {
  final Order order;
  final Widget? trailing;
  const OrderTile({super.key, required this.order, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.amber.shade200,
          child: const Icon(Icons.fastfood, color: Colors.black),
        ),
        title: Text(order.dishName, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
        subtitle: Text(order.id, style: const TextStyle(color: Colors.black54)),
        trailing: trailing ?? Text(
          order.priceLabel,
          style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}