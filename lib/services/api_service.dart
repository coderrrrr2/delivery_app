import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      'https://85a01f90-53aa-40a1-ad48-db0feacab16c.mock.pstmn.io';

  Future<List<dynamic>> getAllProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load products');
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
