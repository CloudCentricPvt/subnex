import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subnex/utils/constants/k_sizes.dart';
import 'package:subnex/views/categories/category_screen.dart';
import 'package:subnex/views/categories/sub_category_screen.dart';
import 'package:subnex/views/home/product_card_view.dart';
import 'home_screen.dart';
import 'hz_scroll_card_view.dart';

class OpterMode extends StatefulWidget {
  const OpterMode({super.key});

  @override
  State<OpterMode> createState() => _OpterModeState();
}

class _OpterModeState extends State<OpterMode> {
  bool isListerMode = false;
  final List<Product> products = [
    Product(
      imageUrl: 'assets/images/device_img.png',
      price: 1800,
      rating: 4.5,
      name: 'Apple iPhone 14 Pro',
      description: '128GB, Natural Titanium',
    ),
    Product(
      imageUrl: 'assets/images/camera_img.png',
      price: 1200,
      rating: 4.5,
      name: 'Canon Camera',
      description: 'True Wireless, Black',
    ),
    Product(
      imageUrl: 'assets/images/camera_img.png',
      price: 900,
      rating: 4.5,
      name: 'Canon Camera',
      description: '1200W, Stainless Steel',
    ),
    Product(
      imageUrl: 'assets/images/bike_img.png',
      price: 50,
      rating: 4.5,
      name: 'Apple iPhone 14 Pro',
      description: 'True Wireless, White',
    ),
  ];

  // Banner Part
  final PageController _pageController = PageController();
  int _currentPage = 0;
  List<String> bannerImages = [
    'https://i.pinimg.com/originals/f5/4a/82/f54a8214b11c2391d2496e32a7d14cb6.jpg',
    'https://t3.ftcdn.net/jpg/02/29/35/40/360_F_229354034_mMvp5Au0zHrNjmti9dvO96eWwr8dVLI8.jpg',
    'https://t3.ftcdn.net/jpg/06/30/89/22/360_F_630892254_5PiJkxqxD2jOcxSE4pVVwVYQcz5TZYk4.jpg',
    'https://i.pinimg.com/originals/f5/4a/82/f54a8214b11c2391d2496e32a7d14cb6.jpg',
    'https://t3.ftcdn.net/jpg/02/29/35/40/360_F_229354034_mMvp5Au0zHrNjmti9dvO96eWwr8dVLI8.jpg',
    'https://t3.ftcdn.net/jpg/06/30/89/22/360_F_630892254_5PiJkxqxD2jOcxSE4pVVwVYQcz5TZYk4.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          (_currentPage + 1) % bannerImages.length,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
        setState(() {
          _currentPage = (_currentPage + 1) % bannerImages.length;
        });
        _startAutoScroll();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //autoSlideBanners(),

          const SizedBox(height: 10),

          //autoSlideCircleDots(),

          const SizedBox(height: 16),

          // Categories
          categories(),

          const SizedBox(height: 16),

          // Nearby Listed Products
          //nearByListedProducts(),
        ],
      ),
    );
  }

  Widget categories() {
    return Column(
      children: [
        Row(
          // Horizontal
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Categories",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: () {
                Get.to(() => const CategoryScreen());
              },
              child: const Row(
                children: [
                  Text("See all", style: TextStyle(color: Colors.indigo)),
                  SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                      width: 20,
                      height: 20,
                      child: CircleAvatar(
                          child: Icon(
                        Icons.navigate_next,
                        size: 14,
                      )))
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: KSizes.spaceBtwItems_16),
        /*SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    goToSubCategory("Electronics");
                  },
                  child: const HzScrollCardView('Electronics', Icons.devices)),
              GestureDetector(
                  onTap: () {
                    goToSubCategory("Instrument");
                  },
                  child:
                      const HzScrollCardView('Instrument', Icons.music_note)),
              GestureDetector(
                  onTap: () {
                    goToSubCategory("Furniture");
                  },
                  child: const HzScrollCardView('Furniture', Icons.chair)),
              GestureDetector(
                  onTap: () {
                    goToSubCategory("Books");
                  },
                  child: const HzScrollCardView('Books', Icons.book)),
            ],
          ),
        ),*/
      ],
    );
  }

  Widget autoSlideBanners() {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        //color: Colors.blue[50],
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: PageView.builder(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemCount: bannerImages.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                bannerImages[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget autoSlideCircleDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        bannerImages.length,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == index ? Colors.blue : Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget nearByListedProducts() {
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Nearby Listed Products",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Text("See all", style: TextStyle(color: Colors.indigo)),
                SizedBox(
                  width: 8,
                ),
                SizedBox(
                    width: 20,
                    height: 20,
                    child: CircleAvatar(
                        child: Icon(
                      Icons.navigate_next,
                      size: 14,
                    )))
              ],
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Products Grid
        Wrap(
          spacing: 16,
          runSpacing: 26,
          children: products
              .map((product) => ProductCard(
                    product: product,
                    screenTitle: "OpterMode",
                  ))
              .toList(),
        )
      ],
    );
  }

  void goToSubCategory(String categoryName) {
    Get.to(() => SubCategoryScreen(
          categoryName: categoryName,
          categoryCode: "21212",
        ));
  }
}
