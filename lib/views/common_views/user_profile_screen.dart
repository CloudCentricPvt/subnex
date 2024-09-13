import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subnex/controllers/user_controller.dart';
import 'package:subnex/models/authentication/user/user_detail_response.dart';
import 'package:subnex/utils/constants/k_colors.dart';
import 'package:subnex/utils/helpers/helper_functions.dart';
import 'package:subnex/utils/reusable_widgets/k_app_bar.dart';
import 'package:subnex/views/common_views/contact_us_screen.dart';
import 'package:subnex/views/common_views/my_profile_screen.dart';
import 'package:subnex/views/home/master_screen.dart';
import 'package:subnex/views/opter_journey/opted_products_screen.dart';
import 'package:subnex/views/opter_journey/sent_request_screen.dart';

import '../../utils/constants/k_sizes.dart';
import '../../utils/reusable_widgets/k_slider.dart';
import '../authentication/login_in_screen.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final UserController _userController = UserController();
  late Future<dynamic> _userProfileInfo;

  final _localStorage = GetStorage();
  late String userName = "";
  late String userEmail = "";
  late String userCode = "";
  late String userProfileImg = "";

  @override
  void initState() {
    userName = _localStorage.read("user_name") ?? "";
    userEmail = _localStorage.read("user_email") ?? "";
    userCode = _localStorage.read("User_Id") ?? "";
    userProfileImg = _localStorage.read("user_profile_img") ?? "";
    _userProfileInfo = _userController.fetchUserDetail(context, userCode);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const KAppBar(),
      ),
      body: FutureBuilder<dynamic>(
        future: _userProfileInfo,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('User detail not found'));
          } else {
            UserDetailResponse? userDetailResponse;
            if (snapshot.data! != null) {
              userDetailResponse = snapshot.data!;
              if (userDetailResponse != null &&
                  userDetailResponse.userDetails != null) {}
            }
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: KHelperFunctions.screenHeight() * 0.16,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: KColors.appPrimaryIndigo,
                            offset: Offset(2.0, 3.0),
                            spreadRadius: 2.0,
                            blurRadius: 12.0)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(32.0),
                          bottomRight: Radius.circular(32.0))),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 0.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: SizedBox(
                                height: 32,
                                width: 32,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: ColoredBox(
                                    color: Colors.white,
                                    child: Icon(
                                      size: 22,
                                      Icons.arrow_back,
                                      color: Colors.blueAccent[100],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: false,
                              child: SizedBox(
                                height: 32,
                                width: 32,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: ColoredBox(
                                    color: Colors.white,
                                    child: Icon(
                                      size: 22,
                                      Icons.edit,
                                      color: Colors.blue[100],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 16.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    userDetailResponse?.userDetails!.username ??
                                        "Username",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(color: Colors.black),
                                  ),
                                  const SizedBox(
                                    height: KSizes.spaceBtwItems_08 - 4,
                                  ),
                                  Text(
                                    userDetailResponse?.userDetails!.email ??
                                        "xyz@gmail.com",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(
                                    height: KSizes.spaceBtwItems_08 - 4,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Get.to(() => const MyProfileScreen());
                                        },
                                        child: Text(
                                          "View Profile",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                color: Colors.black54,
                                                fontWeight: FontWeight.w500,
                                                decoration:
                                                    TextDecoration.underline,
                                                decorationColor: Colors.white,
                                                decorationThickness: 1,
                                              ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: KSizes.spaceBtwItems_08,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          //Get.to(()=> const ProfileInfoScreen());
                                          Get.to(() => const MyProfileScreen());
                                        },
                                        child: SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.blueAccent.shade100,
                                                child: const Icon(
                                                  color: Colors.white,
                                                  Icons.navigate_next,
                                                  size: 14,
                                                ))),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Image.network(
                                    userDetailResponse
                                            ?.userDetails!.profileImage ??
                                        "https://www.iprcenter.gov/image-repository/blank-profile-picture.png/@@images/image.png",
                                    fit: BoxFit.cover,
                                    width: 80,
                                    height: 80),
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: KSizes.spaceBtwItems_08,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomListTile(
                          icon: "assets/icons/deal_icon.png",
                          color: Colors.blue,
                          text: 'My Deals',
                          onTap: () {
                            Get.to(() => const MasterScreen());
                          },
                        ),
                        CustomListTile(
                          icon: "assets/icons/sent_request.png",
                          color: Colors.green,
                          text: 'Sent Requests',
                          onTap: () {
                            Get.to(() => const SentRequestScreen());
                          },
                        ),
                        CustomListTile(
                          icon: "assets/icons/request_product_icon.png",
                          color: Colors.red,
                          text: 'Request Product',
                          onTap: () {
                            Get.to(() => const OptedProductsScreen());
                          },
                        ),
                        CustomListTile(
                          icon: "assets/icons/opted_product_icon.png",
                          color: Colors.red,
                          text: 'Opted Product',
                          onTap: () {
                            Get.to(() => const OptedProductsScreen());
                          },
                        ),
                        CustomListTile(
                          icon: "assets/icons/favrouite_icon.png",
                          color: Colors.red,
                          text: 'Feedback or Ratings',
                          onTap: () {
                            Get.to(() => const OptedProductsScreen());
                          },
                        ),
                        CustomListTile(
                          icon: "assets/icons/contact_us.png",
                          color: Colors.red,
                          text: 'Contact Us',
                          onTap: () {
                            Get.to(() => const ContactUsScreen());
                          },
                        ),
                        CustomListTile(
                          icon: "assets/icons/policy.png",
                          color: Colors.teal,
                          text: 'Privacy Policy',
                          onTap: () {
                            // Action for My Ads Promotions
                          },
                        ),
                        CustomListTile(
                          icon: "assets/icons/contact_us.png",
                          color: Colors.grey,
                          text: 'Settings',
                          onTap: () {
                            // Action for Settings
                          },
                        ),
                        const SizedBox(
                          height: KSizes.spaceBtwItems_12,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 22.0),
                          child: SizedBox(
                            width: KHelperFunctions.screenWidth() * 0.92,
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.red,
                                side: const BorderSide(color: Colors.red),
                              ),
                              onPressed: () {
                                signOutUser();
                              },
                              icon: const Icon(Icons.logout),
                              label: const Text('Sign Out'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }

  void signOutUser() {
    final localStorage = GetStorage();
    localStorage.erase();
    Future.delayed(const Duration(milliseconds: 500));
    localStorage.write("Is_Onboarding_Done", true);
    Get.offAll((() => const LoginInScreen()));
  }
}
