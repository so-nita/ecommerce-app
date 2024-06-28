import 'dart:convert';
import 'package:http/http.dart' as http;

class BannerProvider {
  Future<List<dynamic>> fetchProducts() async {
    final response =
        await http.get(Uri.parse('http://localhost:8000/api/banners'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}
