import 'package:flutter/material.dart';
import 'package:a2ecommerceapp/data/models/carts/carts_model.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedPaymentMethod = 'Credit Card';

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0.0;
    for (var item in Cart.items) {
      totalPrice += (item.price ?? 0.0) * (item.amount ?? 0);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            _buildPaymentOption('Credit Card'),
            _buildPaymentOption('PayPal'),
            _buildPaymentOption('Google Pay'),
            _buildPaymentOption('Apple Pay'),
            const SizedBox(height: 40.0),
            Text(
              'Total: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _completePurchase,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
              ),
              child: const Text(
                'Complete Purchase',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentOption(String paymentMethod) {
    return RadioListTile<String>(
      title: Text(paymentMethod),
      value: paymentMethod,
      groupValue: _selectedPaymentMethod,
      onChanged: (String? value) {
        setState(() {
          _selectedPaymentMethod = value!;
        });
      },
    );
  }

  void _completePurchase() {
    // Clear the cart
    Cart.items.clear();

    // Show a dialog confirming the purchase
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Purchase Completed'),
        content: Text(
            'You have successfully completed your purchase using $_selectedPaymentMethod.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              Navigator.of(context)
                  .pop(); // Go back to the shopping cart screen
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
