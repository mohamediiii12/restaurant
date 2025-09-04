import 'package:flutter/material.dart';
import '../data/repo/search_repository.dart';
import '../data/models/item_model.dart';

class SearchController extends ChangeNotifier {
  final SearchRepository repository;

  SearchController(this.repository);

  bool isLoading = false;
  List<ItemModel> allItems = [];
  List<ItemModel> filteredItems = [];

  Future<void> loadItems() async {
    isLoading = true;
    notifyListeners();
    try {
      allItems = await repository.getAllItems();
      filteredItems = allItems;
    } catch (_) {
      allItems = [];
      filteredItems = [];
    }
    isLoading = false;
    notifyListeners();
  }

  void onSearch(String query) {
    if (query.isEmpty) {
      filteredItems = allItems;
    } else {
      filteredItems = allItems
          .where((i) => i.itemName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
