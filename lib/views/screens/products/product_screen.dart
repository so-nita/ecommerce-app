import 'package:a2ecommerceapp/components/main_header.dart';
import 'package:a2ecommerceapp/views/screens/products/product_card.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: const [
          MainHeader(),
          Expanded(
            child: ProductCard(),
          )
        ],
      ),
    );
  }
}
