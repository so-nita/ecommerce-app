import 'dart:convert';

import 'package:a2ecommerceapp/data/models/products.dart';
import 'package:http/http.dart' as http;

Future<List<ProductModel>> fetchProductsFromApi() async {
  const apiUrl = "http://127.0.0.1:8000/api/product/index";
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    List<ProductModel> products =
        data.map((productJson) => ProductModel.fromJson(productJson)).toList();
    return products;
  } else {
    throw Exception('Failed to load products');
  }
}
