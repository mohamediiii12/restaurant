import 'package:flutter/material.dart';

class OrderCancelledPage extends StatelessWidget {
  const OrderCancelledPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Order Cancelled"),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cancel,
              color: Colors.red,
              size: 100,
            ),
            const SizedBox(height: 20),
            const Text(
              "Your order has been cancelled successfully!",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/orders', (route) => false);
              },
              child: const Text("Back to Orders"),
            ),
          ],
        ),
      ),
    );
  }
}
