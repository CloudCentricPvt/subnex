import 'package:flutter/material.dart';
import 'package:sublet/utils/constants/k_sizes.dart';
import 'package:sublet/utils/reusable_widgets/k_app_bar.dart';
import 'package:sublet/utils/reusable_widgets/k_custom_app_bar.dart';

class ProfileInfoScreen extends StatefulWidget {
  const ProfileInfoScreen({super.key});

  @override
  State<ProfileInfoScreen> createState() => _ProfileInfoScreenState();
}

class _ProfileInfoScreenState extends State<ProfileInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: const KAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0.0,horizontal: 12),
        child: Column(
          children: [
            const KCustomAppBar(screenTitle: "My Profile"),
            const SizedBox(height: KSizes.spaceBtwItems_12,),
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                  fit: BoxFit.fill,
                  width: 100,
                  height: 100,
                  "assets/images/k_profile_img.png"),
            )
          ],
        ),
      ),
    );
  }
}
