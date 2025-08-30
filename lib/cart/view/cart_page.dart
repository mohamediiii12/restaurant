import 'package:flutter/material.dart';
import 'package:restaurant/cart/control/cart_controller.dart';
import '../controllers/cart_controller.dart';
import '../data/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartController _cartController = CartController();

  @override
  void initState() {
    super.initState();
 
    _cartController.addItem(CartItem(name: "Orange Juice", price: 30.0));
    _cartController.addItem(CartItem(name: "Burger Meal", price: 75.0));
    _cartController.addItem(CartItem(name: "Fries", price: 20.0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _cartController.items.length,
              itemBuilder: (context, index) {
                final item = _cartController.items[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: ListTile(
                    leading: const Icon(Icons.fastfood, color: Colors.orange),
                    title: Text(item.name),
                    subtitle: Text("Price: ${item.price} EGP"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _cartController.decreaseQuantity(item);
                            });
                          },
                        ),
                        Text("${item.quantity}", style: const TextStyle(fontSize: 16)),
                        IconButton(
                          icon: const Icon(Icons.add_circle, color: Colors.green),
                          onPressed: () {
                            setState(() {
                              _cartController.increaseQuantity(item);
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), 
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total: ${_cartController.totalAmount} EGP",
                  style: const TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Checkout"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
