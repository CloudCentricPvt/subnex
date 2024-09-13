import 'package:flutter/material.dart';

import '../../utils/reusable_widgets/k_app_bar.dart';
import '../../utils/reusable_widgets/k_custom_app_bar.dart';
import '../home/home_screen.dart';
import '../home/product_card_view.dart';

class LikedProductScreen extends StatefulWidget {
  const LikedProductScreen({super.key});

  @override
  State<LikedProductScreen> createState() => _LikedProductsState();
}

class _LikedProductsState extends State<LikedProductScreen> {
  final List<Product> products = [
    Product(
        imageUrl: 'assets/images/device_img.png',
        price: 1800,
        rating: 4.5,
        name: 'Apple iPhone 14 Pro',
        description: '128GB, Natural Titanium',
        isLikedProduct: true),
    Product(
        imageUrl: 'assets/images/camera_img.png',
        price: 1200,
        rating: 4.5,
        name: 'Canon Camera',
        description: 'True Wireless, Black',
        isLikedProduct: true),
    Product(
        imageUrl: 'assets/images/camera_img.png',
        price: 900,
        rating: 4.5,
        name: 'Canon Camera',
        description: '1200W, Stainless Steel',
        isLikedProduct: true),
    Product(
        imageUrl: 'assets/images/bike_img.png',
        price: 50,
        rating: 4.5,
        name: 'Apple iPhone 14 Pro',
        description: 'True Wireless, White',
        isLikedProduct: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const KAppBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// --- Back Arrow & App Screen Title
              const KCustomAppBar(screenTitle: "Liked Products"),

              const SizedBox(
                height: 12,
              ),

              /// --- Sub Categories Grid View
              Wrap(
                spacing: 16,
                runSpacing: 26,
                children: products
                    .map((product) => ProductCard(product: product,screenTitle: "LikedProducts",))
                    .toList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
