import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:subnex/utils/constants/k_colors.dart';
import 'package:subnex/utils/helpers/helper_functions.dart';

import '../../utils/constants/k_sizes.dart';
import '../../utils/reusable_widgets/k_app_bar.dart';
import '../onboarding/onboarding_info.dart';

class ProductImages {
  List<OnboardingInfo> items = [
    OnboardingInfo(
        title: "", description: "", image: "assets/images/bike_img.png"),
    OnboardingInfo(
        title: "", description: "", image: "assets/images/camera_img.png"),
    OnboardingInfo(
        title: "", description: "", image: "assets/images/bike_img.png"),
    OnboardingInfo(
        title: "", description: "", image: "assets/images/camera_img.png")
  ];
}

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetailScreen> {
  final controller = ProductImages();
  final pageViewController = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const KAppBar(),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false, // Keeps the app bar visible at the top
            floating: true, // Doesn't float above the content
            expandedHeight: KHelperFunctions.screenHeight() * 0.40, // Adjust height as needed
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Column(
                children: [
                  _wPImgContainer(),
                  _wSliderDots()
                ],
              ),
            ),
          ),
          /*SliverPersistentHeader(
            pinned: true,
            delegate: PDetailDelegate(),
          ),*/
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(0.0, 0.5),
                    blurRadius: 1.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16.0, right: 16.0, bottom: 22.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: KSizes.spaceBtwSections),
                    Text(
                      "Apple iPhone 15 Pro, 128GB, Natural Titanium",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: KSizes.spaceBtwItems_16),
                    _wPListerLocation(),
                    const SizedBox(height: KSizes.spaceBtwItems_16),
                    _wPAvailability(),
                    const SizedBox(height: KSizes.spaceBtwItems_16),
                    _wPDescription(),
                    const SizedBox(height: KSizes.spaceBtwItems_16),
                    _wPRatings(),
                    const SizedBox(height: KSizes.spaceBtwItems_16),
                    _wPRentsDetail(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _wPImgContainer() {
    return Stack(
      children: [
        Container(
          width: KHelperFunctions.screenWidth(),
          height: KHelperFunctions.screenHeight() * 0.4,
          color: Colors.white,
          child: PageView.builder(
            controller: pageViewController,
            itemCount: controller.items.length,
            onPageChanged: (index) => setState(() {
              if (index == controller.items.length - 1) {
                isLastPage = true;
              } else {
                isLastPage = false;
              }
            }),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(
                    left: 22.0, bottom: 18.0, top: 40.0, right: 22.0),
                child: Center(
                  child: Hero(
                    tag: controller.items[index].image,
                    child: Image.asset(
                      controller.items[index].image,
                      fit: BoxFit.fill,
                      alignment: Alignment.center,
                      width: KHelperFunctions.screenWidth() * 0.8,
                      height: KHelperFunctions.screenHeight() * 0.30,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 68.0),
          child: Align(
            alignment: Alignment.topRight,
            child: Positioned(
                child: ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(7.0),
                shape: MaterialStateProperty.all(const CircleBorder()),
                padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                backgroundColor:
                    MaterialStateProperty.all(Colors.grey.shade300),
                // <-- Button color
                overlayColor:
                    MaterialStateProperty.resolveWith<Color?>((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.blue; // <-- Splash color
                  }
                  return null;
                }),
              ),
              child: const Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
            )),
          ),
        )
      ],
    );
  }

  Widget _wSliderDots() {
    return Column(
      children: [
        Container(
          width: KHelperFunctions.screenWidth(),
          height: 20,
          decoration: const BoxDecoration(
            color: Colors.white,
            /*borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32.0),
              bottomRight: Radius.circular(32.0),
            ),*/
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 10.0),
                blurRadius: 0.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ),
            ],
          ),
          child: Center(
            child: SmoothPageIndicator(
              controller: pageViewController,
              count: controller.items.length,
              onDotClicked: (index) => pageViewController.animateToPage(index,
                  duration: const Duration(microseconds: 600),
                  curve: Curves.easeIn),
              effect: const WormEffect(
                dotHeight: 6,
                dotWidth: 6,
                activeDotColor: Colors.blueAccent,
              ),
            ),
          ),
        ),
        const SizedBox(height: KSizes.spaceBtwSections),
      ],
    );
  }

  Widget _wPListerLocation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(width: 14, height: 22, "assets/icons/location_icon.png"),
        const SizedBox(width: KSizes.spaceBtwItems_12),
        Flexible(
          child: Text(
            "Mayur Vihar, Phase-I Noida",
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }

  Widget _wPAvailability() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                "Available for Rent",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600, color: KColors.appPrimaryGrey),
              ),
            ),
            const SizedBox(width: KSizes.spaceBtwItems_12),
            Container(
              height: 16,
              width: 16,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          ],
        ),
        const SizedBox(height: KSizes.spaceBtwItems_16 - 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Material(
              elevation: 6.0,
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                height: 62.0,
                width: 110.0,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Rating Pattern",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.w400)),
                    Text("Weekly",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w400))
                  ],
                ),
              ),
            ),
            Material(
              elevation: 6.0,
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                height: 62.0,
                width: 110.0,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Rent",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.w400)),
                    Text("\$20 / Week",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w400))
                  ],
                ),
              ),
            ),
            Material(
              elevation: 6.0,
              borderRadius: BorderRadius.circular(6.0),
              child: Container(
                height: 62.0,
                width: 110.0,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Duration",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(fontWeight: FontWeight.w400)),
                    Text("2 - 4 Week",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w400))
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _wPDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Description",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: KSizes.spaceBtwItems_08 - 4),
        Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since.",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  Widget _wPRatings() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rating & Reviews",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: KSizes.spaceBtwItems_08 - 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            RatingBar.builder(
              initialRating: 4.5,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 22.0,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                //print(rating);
              },
              unratedColor: Colors.grey[400],
              glow: false,
              glowColor: Colors.amber.withOpacity(0.5),
              ignoreGestures: true, // On Click on Rating Bar
            ),
            // const Icon(
            //   Icons.star,
            //   color: Colors.orange,
            // ),
            const SizedBox(width: 12.0),
            Text(
              "4.5 / 5",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w400, color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }

  Widget _wPRentsDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Rented Out Details",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: KSizes.spaceBtwItems_08 - 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 40,
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.lightGreenAccent.shade700, // Border color
                  width: 1.5, // Border width
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                ), // Rounded corners
              ),
              child: const Text(
                '5',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Container(
              height: 40,
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.lightGreenAccent.shade700, // Border color
                  width: 1.5, // Border width
                ),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ), // Rounded corners
              ),
              child: const Text(
                'Successful deals',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ],
    );
  }

}

class PDetailDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white60,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              offset: const Offset(0.0, 0.5),
              blurRadius: 1.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
              left: 16.0, right: 16.0, bottom: 22.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: KSizes.spaceBtwSections),
              Text(
                "Apple iPhone 15 Pro, 128GB, Natural Titanium",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: KSizes.spaceBtwItems_16),
              //_wPListerLocation(),
              const SizedBox(height: KSizes.spaceBtwItems_16),
              //_wPAvailability(),
              const SizedBox(height: KSizes.spaceBtwItems_16),
              //_wPDescription(),
              const SizedBox(height: KSizes.spaceBtwItems_16),
              //_wPRatings(),
              const SizedBox(height: KSizes.spaceBtwItems_16),
              //_wPRentsDetail(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 140.0;

  @override
  double get minExtent => 140.0;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}



