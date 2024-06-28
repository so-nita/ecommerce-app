import 'package:a2ecommerceapp/data/models/carts/carts_model.dart';
import 'package:a2ecommerceapp/views/screens/shopping_cart/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:a2ecommerceapp/data/models/products.dart';

import '../../product_details/product_details_screen.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  //@override
  @override
  Widget build(BuildContext context) {
    // Calculate total price
    double totalPrice = 0.0;
    for (var item in Cart.items) {
      totalPrice += (item.price ?? 0.0) * (item.amount ?? 0);
    }

    return Scaffold(
      backgroundColor: Colors.grey[150],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.grey[150]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'Shopping Cart',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 50.0),
            Cart.items.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "Your Cart is empty! Let's go shopping",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: Cart.items.length,
                      itemBuilder: (context, index) {
                        final item = Cart.items[index];
                        return Card(
                          elevation: 2.0,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                item.imageUrl ?? '', // Display the image
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.name ?? '',
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  'Price: \$${item.price?.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueAccent,
                                    // decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                              ],
                            ),
                            subtitle: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _decreaseItemAmount(item);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: const Text(
                                      '-',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Text(
                                  item.amount.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.blue,
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                GestureDetector(
                                  onTap: () {
                                    _increaseItemAmount(item);
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: const Text(
                                      '+',
                                      style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                _removeItemFromCart(item);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            if (Cart.items.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Total: \$${totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            if (Cart.items.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Add functionality for Buy Now button
                    // For example, navigate to checkout screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CheckoutScreen(),
                        ));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                  ),
                  child: const Text(
                    'Buy Now',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }

  // Function to remove an item from the cart
  void _removeItemFromCart(ProductModel item) {
    Cart.removeItem(item);
    setState(() {
      // Update the UI
    });
  }

  // Function to increase the amount of an item in the cart
  void _increaseItemAmount(ProductModel item) {
    setState(() {
      item.amount = item.amount! + 1;
    });
  }

  // Function to decrease the amount of an item in the cart
  void _decreaseItemAmount(ProductModel item) {
    setState(() {
      if (item.amount! > 1) {
        item.amount = item.amount! - 1;
      }
    });
  }
}
