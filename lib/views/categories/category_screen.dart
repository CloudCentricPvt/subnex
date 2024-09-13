import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:subnex/models/category/category_response.dart';
import 'package:subnex/utils/reusable_widgets/k_custom_app_bar.dart';
import 'package:subnex/views/categories/sub_category_screen.dart';

import '../../controllers/category_controller.dart';
import '../../utils/constants/k_colors.dart';
import '../../utils/loaders/k_square_outline_shimmer.dart';
import '../../utils/reusable_widgets/k_app_bar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryController _controller = CategoryController();
  late Future<List<CategoryList>> _categories;

  @override
  void initState() {
    super.initState();
    _categories = _controller.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const KAppBar(),
      ),
      /*const SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              KCustomAppBar(screenTitle: "All Categories"),

              SizedBox(
                height: 12,
              ),

              /// --- Sub Categories Grid View
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  KOutlinedCard(
                      icon: Icon(
                        Icons.devices,
                        size: 60,
                      ),
                      title: "Home Appliances",),
                  KOutlinedCard(
                      icon: Icon(
                        Icons.mobile_friendly_rounded,
                        size: 60,
                      ),
                      title: "Multimedia"),
                  KOutlinedCard(
                      icon: Icon(
                        Icons.medical_information,
                        size: 60,
                      ),
                      title: "Medical")
                ],
              ),
            ],
          ),
        ),
      ),*/
      body: FutureBuilder<List<CategoryList>>(
        future: _categories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //return const Center(child: CircularProgressIndicator());
            return const KSquareOutlineShimmer(
              screenTitle: 'All Categories',
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No categories found'));
          } else {
            List<CategoryList> categories = snapshot.data!;
            //return ShimmerList();
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const KCustomAppBar(screenTitle: "All Categories"),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: categories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 20),
                      itemBuilder: (BuildContext context, int index) {
                        final category = categories[index];
                        return GestureDetector(
                            child: KCatOutlinedCard(
                                image: category.imagePath!,
                                title: category.name!),
                            onTap: () {
                              //print('tapped');
                              Get.to(() => SubCategoryScreen(
                                  categoryName: category.name!,
                                  categoryCode: category.categoryCode!));
                            });
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class KCatOutlinedCard extends StatelessWidget {
  final String image;
  final String title;

  const KCatOutlinedCard({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      //width: MediaQuery.of(context).size.width * 0.22,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: KColors.appPrimary),
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 1.3), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Image.network(
                image,
                width: 70,
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 11),
            ),
          ],
        ),
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const KCustomAppBar(screenTitle: "All Categories"),
          const SizedBox(
            height: 12,
          ),
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: GridView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 15,
              // Placeholder item count
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 16, crossAxisSpacing: 20),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
