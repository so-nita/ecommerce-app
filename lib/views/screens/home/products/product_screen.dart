import 'package:a2ecommerceapp/data/models/products.dart';
import 'package:a2ecommerceapp/data/provider/products_api.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ProductModel>>(
      future: fetchProductsFromApi(),
      builder: (context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Failed to load products'),
          );
        } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
          return Container(
            height: 220, // Set a fixed height for the product list container
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return _buildProductItem(context, snapshot.data![index]);
              },
            ),
          );
        } else {
          return const Center(
            child: Text('No products available'),
          );
        }
      },
    );
  }

  Widget _buildProductItem(BuildContext context, ProductModel product) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 180, // Set a fixed width for each product item
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // Lighter shadow color
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Display product image
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                product.imageUrl ?? '', // Load image from URL
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Display product name with ellipsis if too long
          Text(
            product.name!,
            style: const TextStyle(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          // Display product price
          Text(
            'Price: \$${product.price?.toStringAsFixed(2)}',
            style: const TextStyle(
              color: Colors.blueAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          // You can add more product details or widgets here (e.g., description)
        ],
      ),
    );
  }
}
