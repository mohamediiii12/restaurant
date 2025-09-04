import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/user_model.dart';

class ProfileRemoteSource {
  Future<UserModel> fetchUser() async {
    final response = await http.get(
      Uri.parse('https://fakerestaurantapi.runasp.net/api/User/getusercode?UserEmail=tech@example.com&Password=let\'s go'),
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final usercode = data['usercode'];
      return UserModel(userEmail: 'tech@example.com', usercode: usercode);
    } else {
      throw Exception('Failed to load user');
    }
  }
}