import 'package:flutter/material.dart';

class OrderCancelledSuccessPage extends StatelessWidget {
  const OrderCancelledSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cancel Success"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "الأوردر اتلغى بنجاح 🎉",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
