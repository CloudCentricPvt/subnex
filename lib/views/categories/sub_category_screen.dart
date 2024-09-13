import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:subnex/models/category/sub_category_response.dart';
import 'package:subnex/utils/helpers/helper_functions.dart';
import 'package:subnex/utils/reusable_widgets/k_outlined_card.dart';

import '../../controllers/category_controller.dart';
import '../../utils/constants/k_colors.dart';
import '../../utils/loaders/k_square_outline_shimmer.dart';
import '../../utils/reusable_widgets/k_app_bar.dart';
import '../../utils/reusable_widgets/k_custom_app_bar.dart';
import '../opter_journey/sub_category_products_screen.dart';

class SubCategoryScreen extends StatefulWidget {
  final String? categoryName;
  final String? categoryCode;

  const SubCategoryScreen(
      {super.key, required this.categoryName, required this.categoryCode});

  @override
  State<SubCategoryScreen> createState() => _SubCategoryScreenState();
}

class _SubCategoryScreenState extends State<SubCategoryScreen> {
  final CategoryController _controller = CategoryController();
  late Future<List<SubCategoryList>> _subCategories;

  @override
  void initState() {
    if (widget.categoryCode != null) {
      _subCategories = _controller.getSubCategories(widget.categoryCode!);
    }
    super.initState();
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
      /*body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// --- Back Arrow & App Screen Title
              KCustomAppBar(screenTitle: widget.categoryName!),

              const SizedBox(
                height: 12,
              ),

              //Get.to(()=> const SubCategoryProductsScreen()

              /// --- Sub Categories Grid View
            ],
          ),
        ),
      ),*/

      body: FutureBuilder<List<SubCategoryList>>(
        future: _subCategories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            //return const Center(child: CircularProgressIndicator());
            return KSquareOutlineShimmer(
                screenTitle: widget.categoryName ?? "Sub Categories");
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            //return KSquareOutlineShimmer(screenTitle: widget.categoryName ?? "Sub Categories");
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                children: [
                  KCustomAppBar(screenTitle: widget.categoryName!),
                  Expanded(
                      child: Padding(
                    //KHelperFunctions.screenHeight() * 0.2
                    padding: const EdgeInsets.only(bottom: 140),
                    child: Center(
                        child: Image.asset(
                      "assets/images/no_data_found_img.png",
                      width: 180,
                      height: 180,
                    )),
                  )),
                ],
              ),
            );
          } else {
            List<SubCategoryList> subCategories = snapshot.data!;
            //return ShimmerList();
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  KCustomAppBar(screenTitle: widget.categoryName!),
                  const SizedBox(
                    height: 12,
                  ),
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: subCategories.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 20),
                      itemBuilder: (BuildContext context, int index) {
                        final sub_category = subCategories[index];
                        return GestureDetector(
                            child: KCatOutlinedCard(
                                image: sub_category.imagePath!,
                                title: sub_category.name!),
                            onTap: () {
                              //print('tapped');
                              // Get.to(() => SubCategoryScreen(
                              //     categoryName: sub_category.name!,
                              //     categoryCode: sub_category.subCategoryCode!));
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
              height: 10,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
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
