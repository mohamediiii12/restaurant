import 'package:flutter/material.dart';

class OrderHomePage extends StatelessWidget {
  const OrderHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, '/orders'),
          child: const Text('My Orders'),
        ),
      ),
      floatingActionButton: _buildFab(context),
    );
  }
}

Widget _buildFab(BuildContext context) {
  return FloatingActionButton(
    onPressed: () {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => _quickActions(ctx),
      );
    },
    child: const Icon(Icons.menu),
  );
}

Widget _quickActions(BuildContext context) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.count(
        crossAxisCount: 5,
        shrinkWrap: true,
        children: [
          _action(context, Icons.home, 'Home', () => Navigator.pop(context)),
          _action(context, Icons.support_agent, 'Call', () {}),
          _action(context, Icons.favorite, 'Favorites', () {}),
          _action(context, Icons.receipt_long, 'My Orders', () => Navigator.pushNamed(context, '/orders')),
          _action(context, Icons.bar_chart, 'Reports', () {}),
        ],
      ),
    ),
  );
}

Widget _action(BuildContext c, IconData icon, String label, VoidCallback onTap) {
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [Icon(icon), const SizedBox(height: 6), Text(label, style: const TextStyle(fontSize: 12))],
    ),
  );
}