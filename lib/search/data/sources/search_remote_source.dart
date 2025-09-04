import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchRemoteSource {
  Future<List<Map<String, dynamic>>> fetchAllItems() async {
    final response = await http.get(
      Uri.parse('https://fakerestaurantapi.runasp.net/api/Restaurant/items'),
    );
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> searchItems(String query) async {
    final response = await http.get(
      Uri.parse('https://fakerestaurantapi.runasp.net/api/Restaurant/items?ItemName=$query'),
    );
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      return [];
    }
  }
}