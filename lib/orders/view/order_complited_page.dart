import 'package:flutter/material.dart';

class OrderCompletedPage extends StatelessWidget {
  const OrderCompletedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Completed Orders"),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          "هنا هتعرض الأوردرات اللي خلصت ✅",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
