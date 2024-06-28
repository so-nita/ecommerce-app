import 'package:a2ecommerceapp/data/models/products.dart';
import 'package:a2ecommerceapp/data/provider/products_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../views/screens/shopping_cart/shopping_cart.dart';

class MainHeader extends StatefulWidget {
  const MainHeader({Key? key}) : super(key: key);

  @override
  _MainHeaderState createState() => _MainHeaderState();
}

class _MainHeaderState extends State<MainHeader> {
  TextEditingController _searchController = TextEditingController();
  List<ProductModel> _products = [];
  List<ProductModel> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void _fetchProducts() async {
    try {
      List<ProductModel> products = await fetchProductsFromApi();
      setState(() {
        _products = products;
        _filteredProducts = List<ProductModel>.from(
            _products); // Initialize filtered list with all products
      });
    } catch (error) {
      print('Error fetching products: $error');
    }
  }

  void _onSearchTextChanged(String newText) {
    setState(() {
      _filteredProducts = _products.where((product) {
        final name = product.name!.toLowerCase();
        final description = product.description!.toLowerCase();
        final searchQuery = newText.toLowerCase();
        return name.contains(searchQuery) || description.contains(searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(24)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    offset: const Offset(0, 0),
                    blurRadius: 8,
                  ),
                ],
              ),
              child: TextField(
                controller: _searchController,
                onChanged: _onSearchTextChanged,
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 16,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'Search products...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(24),
                    ),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            height: 46,
            width: 46,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(24)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.6),
                  offset: const Offset(0, 0),
                  blurRadius: 8,
                ),
              ],
            ),
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShoppingCartScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
