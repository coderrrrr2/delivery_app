import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:delivery_app/models/meal_item.dart';

class ApiService {
  static const String baseUrl = 'https://api.routelift.com/api/test';
  Future<List<MealItem>> getAllProducts() async {
    final response = await http.get(
      Uri.parse('$baseUrl/products'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(
        response.body,
      );

      if (responseData['success'] == true) {
        // Extract the list of products from the 'data' field
        final List<dynamic> jsonList = responseData['data'];

        // Convert the list of Map<String, dynamic> to a list of MealItem
        List<MealItem> mealItemList = jsonList
            .map((json) => MealItem.fromJson(json as Map<String, dynamic>))
            .toList();

        return mealItemList;
      } else {
        throw Exception('Failed to fetch products: ${responseData['message']}');
      }
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }

  Future<void> checkout(String productName, double price, int quantity) async {
    final response = await http.post(
      Uri.parse('$baseUrl/checkout'),
      body: jsonEncode({
        'productName': productName,
        'price': price,
        'quantity': quantity,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to checkout');
    }
  }
}

final userProvider = Provider.autoDispose<ApiService>((ref) {
  return ApiService();
});
