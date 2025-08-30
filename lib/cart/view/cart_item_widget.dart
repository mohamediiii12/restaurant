import 'package:flutter/material.dart';
import '../data/cart_item.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem item;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final VoidCallback onRemove;

  const CartItemWidget({
    super.key,
    required this.item,
    required this.onIncrease,
    required this.onDecrease,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(item.imageUrl, width: 50, height: 50),
      title: Text(item.name),
      subtitle: Text("\$${item.price} x ${item.quantity}"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(icon: const Icon(Icons.remove), onPressed: onDecrease),
          Text("${item.quantity}"),
          IconButton(icon: const Icon(Icons.add), onPressed: onIncrease),
          IconButton(icon: const Icon(Icons.delete), onPressed: onRemove),
        ],
      ),
    );
  }
}
