import 'package:a2ecommerceapp/components/main_header.dart';
import 'package:a2ecommerceapp/views/screens/home/category/category.dart';
import 'package:a2ecommerceapp/views/screens/home/components/homepage.dart';
import 'package:a2ecommerceapp/views/screens/home/products/product_screen.dart';
import 'package:a2ecommerceapp/views/screens/home/section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const MainHeader(),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [
                  SizedBox(height: 20),
                  ProductList(),
                  SizedBox(height: 20),
                  SectionTitle(title: 'Category'),
                  CategoryList(),
                  SizedBox(height: 20),
                  SectionTitle(title: 'Products'),
                  ProductListScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
