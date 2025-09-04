import '../sources/search_remote_source.dart';
import '../models/item_model.dart';

class SearchRepository {
  final SearchRemoteSource source;

  SearchRepository(this.source);

  Future<List<ItemModel>> getAllItems() async {
    final items = await source.fetchAllItems();
    return items.map((json) => ItemModel.fromJson(json)).toList();
  }

  Future<List<ItemModel>> searchItems(String query) async {
    final items = await source.searchItems(query);
    return items.map((json) => ItemModel.fromJson(json)).toList();
  }
}