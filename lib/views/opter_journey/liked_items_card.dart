import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_views/product_detail_screen.dart';
import '../home/home_screen.dart';

class LikedItemsCard extends StatelessWidget {
  final Product product;

  const LikedItemsCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => const ProductDetailScreen());
      },
      child: Container(
        width: MediaQuery.of(context).size.width / 2 - 24,
        height: 190,
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 22.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Padding(
                      padding:
                      const EdgeInsets.only(top: 20.0, left: 28, right: 28),
                      child: Hero(
                        tag: product.imageUrl,
                        child: Image.asset(
                          product.imageUrl,
                          height: 80.0,
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  //top: 8.0,
                  //left: 8.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4.0,
                      horizontal: 8.0,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(12)),
                    ),
                    child: Text(
                      '₹${product.price}/Day',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 12.0,
                      horizontal: 6.0,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(10.0),
                        border:
                        Border.all(color: Colors.white70, strokeAlign: 1)),
                    child: Row(
                      children: [
                        Text(
                          product.rating.toString(),
                          style: const TextStyle(fontSize: 12.0),
                        ),
                        const SizedBox(width: 4.0),
                        const Icon(Icons.star,
                            color: Colors.orange, size: 14.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product.name,
                style: const TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product.description,
                style: const TextStyle(fontSize: 13.0, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}