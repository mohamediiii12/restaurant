import 'package:flutter/material.dart';
import 'package:restaurant/home feature/data/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(restaurant.image, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(restaurant.name,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700)),
                        const SizedBox(height: 4),
                        Text(
                            '${restaurant.category} • ${restaurant.deliveryTime}',
                            style: const TextStyle(color: Colors.black54)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, size: 18),
                      const SizedBox(width: 4),
                      Text(restaurant.rating.toStringAsFixed(1)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
