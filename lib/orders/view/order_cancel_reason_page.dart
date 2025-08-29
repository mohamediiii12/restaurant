import 'package:flutter/material.dart';

class OrderCancelReasonPage extends StatelessWidget {
  const OrderCancelReasonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cancel Order"),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Choose a reason for cancellation:",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // أسباب الإلغاء
            ListTile(
              title: const Text("Changed my mind"),
              leading: const Icon(Icons.cancel),
              onTap: () {
                Navigator.pushNamed(context, '/orders/cancelled-success');
              },
            ),
            ListTile(
              title: const Text("Found a better price"),
              leading: const Icon(Icons.money_off),
              onTap: () {
                Navigator.pushNamed(context, '/orders/cancelled-success');
              },
            ),
            ListTile(
              title: const Text("Other"),
              leading: const Icon(Icons.more_horiz),
              onTap: () {
                Navigator.pushNamed(context, '/orders/cancelled-success');
              },
            ),
          ],
        ),
      ),
    );
  }
}
