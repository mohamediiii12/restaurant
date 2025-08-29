import 'package:flutter/material.dart';

class OrderActivePage extends StatelessWidget {
  const OrderActivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Active Orders"),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          "هنا هتظهر الطلبات اللي شغالة دلوقتي",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
