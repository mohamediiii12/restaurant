import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final ValueChanged<String>? onChanged;
  const HomeSearchBar({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: 'Search for restaurant or meal',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}
