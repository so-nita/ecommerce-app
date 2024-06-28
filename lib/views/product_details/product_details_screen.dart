import 'package:flutter/material.dart';
import 'package:a2ecommerceapp/data/models/carts/carts_model.dart';
import 'package:a2ecommerceapp/views/screens/shopping_cart/shopping_cart.dart';
import 'package:a2ecommerceapp/data/models/products.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailsScreen({Key? key, required this.product})
      : super(key: key);

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  void initState() {
    super.initState();
    // Set the amount to 1 when the screen is first displayed
    widget.product.amount ??= 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display product image
            Center(
              child: Image.network(
                widget.product.imageUrl ?? '',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20.0),
            // Display product name
            Text(
              widget.product.name ?? '',
              style: const TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            // Display product price
            Text(
              '\$${widget.product.price ?? ''}',
              style: const TextStyle(
                fontSize: 18.0,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text('Description:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
            const SizedBox(height: 20.0),
            Text(
              widget.product.description ?? '',
              style: const TextStyle(
                height: 2,
                letterSpacing: 1,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (widget.product.amount! > 1) {
                    widget.product.amount = widget.product.amount! - 1;
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Icon(
                  Icons.remove,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(width: 10.0),
            Text(
              widget.product.amount.toString(),
              style: const TextStyle(
                fontSize: 22,
                color: Colors.blue,
              ),
            ),
            const SizedBox(width: 10.0),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.product.amount = widget.product.amount! + 1;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: const Icon(Icons.add, color: Colors.blue),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                addToCart(widget.product); // Call addToCart method
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 20.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }

  // Add the addToCart method here
  void addToCart(ProductModel product) {
    Cart.addToCart(product);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ShoppingCartScreen()),
    );
  }
}
