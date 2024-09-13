import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:subnex/utils/constants/k_colors.dart';
import 'package:subnex/utils/constants/k_sizes.dart';
import 'package:subnex/utils/reusable_widgets/k_app_bar.dart';
import 'package:subnex/views/categories/category_screen.dart';
import 'package:subnex/views/common_views/user_profile_screen.dart';
import 'package:subnex/views/home/lister_mode.dart';
import 'package:subnex/views/home/opter_mode.dart';

import '../../utils/reusable_widgets/k_slider.dart';
import '../category_new.dart';

class Product {
  final String imageUrl;
  final double price;
  final double rating;
  final String name;
  final String description;
  final bool? isLikedProduct;

  Product(
      {required this.imageUrl,
      required this.price,
      required this.rating,
      required this.name,
      required this.description,
      this.isLikedProduct});
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isListerMode = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            KAppBar(),
            Spacer(),
            Icon(Icons.notifications_none, color: Colors.black)
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(() => const UserProfileScreen());
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: /*CircleAvatar(
                backgroundImage: AssetImage(
                    "assets/images/profile_img.png"), // Replace with your profile image URL
              )*/
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image.network(
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover,
                          "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png")),
            ),
          ),
        ],
      ),
      drawer: !isListerMode ? const KSlider() : const KSliderLister(),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// --- Address
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                                width: 14,
                                height: 22,
                                "assets/icons/location_icon.png"),
                            const SizedBox(width: 8),
                            const Text("157 - Vishwakarma Road",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(height: 4),
                        const Text("Sector 63, Noida 201306",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: switchToggle(),
                      ),
                    )
                  ],
                ),

                /// --- Search and Toggle Switch
                // -- Un Comment later
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    searchBar(),
                  ],
                ),

                /// --- User Mode
                // -- Un Comment later
                const OpterMode()
                //!isListerMode ? const OpterMode() : const ListerMode()
              ],
            )),
      ),
    );
  }

  Widget searchBar() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 18.0,
          right: 0.0,
          bottom: 18.0,
        ),
        child: Container(
          height: 54,
          width: double.infinity * 0.70,
          decoration: BoxDecoration(
            //border: Border.all(width: 0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontFamily: 'Inter',
                fontSize: 18,
              ),
              border: InputBorder.none,
              hintText: 'Search here...',
            ),
          ),
        ),
      ),
    );
  }

  Widget switchToggle() {
    return AnimatedToggleSwitch<bool>.dual(
      current: isListerMode,
      first: false,
      second: true,
      spacing: 6.0,
      style: ToggleStyle(
        backgroundColor: Colors.white,
        borderColor: Colors.transparent,
        boxShadow: [
          const BoxShadow(
            color: Colors.black12,
            spreadRadius: 1.0,
            blurRadius: 1.0,
            offset: Offset(-0.5, -0.5),
          ),
          const BoxShadow(
            color: Colors.black12,
            spreadRadius: 1.0,
            blurRadius: 1.0,
            offset: Offset(0.5, 0.5),
          ),
        ],
        borderRadius: BorderRadius.circular(6.0), // for rectangular border
      ),
      borderWidth: 4.0,
      height: 40,
      onChanged: (b) => setState(() => isListerMode = b),
      styleBuilder: (b) =>
          ToggleStyle(indicatorColor: b ? Colors.orange : KColors.appPrimary),
      iconBuilder: (value) => value
          ? Text('Lister',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w600))
          : Text('Opter',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600)),
      textBuilder: (value) => value
          ? Center(
              child: Text('Opter',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight: FontWeight.w600)),
            )
          : Text('Lister',
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.w600)),
    );
  }
}

class InnerShadowContainer extends StatelessWidget {
  const InnerShadowContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1), // Shadow color
                blurRadius: 15, // Shadow blur radius
                offset: const Offset(0, 4), // Shadow position
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.10),
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withOpacity(0.10),
                ],
                stops: const [0.0, 0.1, 1.0, 1.0],
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.black.withOpacity(0.10),
                  Colors.transparent,
                  Colors.transparent,
                  Colors.black.withOpacity(0.10),
                ],
                stops: const [0.0, 0.05, 1.0, 1.0],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  color: KColors.appPrimaryIndigo,
                  child: Image.asset(
                    "assets/images/bike_img.png",
                    width: 104,
                    height: 114,
                    scale: 7,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Apple iPhone 15 Pro,128GB,\nNatural Titanium",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: KColors.appPrimary),
                      ),
                      const SizedBox(
                        height: KSizes.spaceBtwItems_08 / 2,
                      ),
                      SizedBox(
                        width: 220,
                        // Set width according to your layout requirements
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "29 Aug, 2024",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(6.0),
                                child: ColoredBox(
                                  color: Colors.grey,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0, horizontal: 12),
                                    child: Text("Delist",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.white)),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: KSizes.spaceBtwItems_08 / 2,
                      ),
                      SizedBox(
                        width: 220,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "\$200 / Week",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6.0),
                              child: ColoredBox(
                                color: Colors.grey.shade100,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 4.0, horizontal: 12),
                                  child: Text("Active",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: KColors.appPrimaryGreen)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
