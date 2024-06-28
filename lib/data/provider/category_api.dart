import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../views/screens/home/category/category.dart';
import '../models/category/category_model.dart';

// Function to fetch categories from API
Future<List<CategoryModel>> fetchCategoriesFromApi() async {
  const apiUrl =
      "http://127.0.0.1:8000/api/category/index"; // Replace with your API URL
  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    // If API call is successful, parse JSON response
    List<dynamic> data = json.decode(response.body);
    List<CategoryModel> categories = data
        .map((categoryJson) => CategoryModel.fromJson(categoryJson))
        .toList();
    return categories;
  } else {
    // If API call fails, throw an exception
    throw Exception('Failed to load categories');
  }
}
