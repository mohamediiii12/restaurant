import 'package:flutter/material.dart';
import '../data/order_details.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderDetails order;

  const OrderDetailsPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("تفاصيل الأوردر"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("رقم الأوردر: ${order.id}",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text("المنتج: ${order.productName}",
                style: const TextStyle(fontSize: 16)),
            Text("الكمية: ${order.quantity}",
                style: const TextStyle(fontSize: 16)),
            Text("سعر الوحدة: ${order.price} جنيه",
                style: const TextStyle(fontSize: 16)),
            const Divider(height: 30),
            Text("الإجمالي: ${order.total} جنيه",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
          ],
        ),
      ),
    );
  }
}