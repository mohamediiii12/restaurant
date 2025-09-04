import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant/search/control/search_controller.dart' as custom;

import 'widgets/search_item.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<custom.SearchController>(context);

    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search for food...',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                hintStyle: TextStyle(color: Colors.grey),
              ),
              onChanged: (value) {
                controller.onSearch(value);
              },
            ),
          ),
          Expanded(
            child: controller.isLoading
                ? Center(child: CircularProgressIndicator())
                : controller.filteredItems.isEmpty
                    ? Center(child: Text('No items found'))
                    : ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: controller.filteredItems.length,
                        itemBuilder: (context, index) {
                          final item = controller.filteredItems[index];
                          return SearchItem(
                            name: item.itemName,
                            price: item.itemPrice,
                            image: item.imageUrl,
                            onTap: () {},
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }
}
