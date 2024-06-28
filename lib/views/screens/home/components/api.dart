import 'dart:convert';
import 'package:a2ecommerceapp/constants/constant.dart';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchProducts() async {
  final response = await http.get(Uri.parse('$kBaseUrl/banners'));

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load products');
  }
}
