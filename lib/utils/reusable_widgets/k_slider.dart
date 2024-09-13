import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sublet/views/common_views/contact_us_screen.dart';
import 'package:sublet/views/home/home_screen.dart';
import 'package:sublet/views/opter_journey/opted_products_screen.dart';
import 'package:sublet/views/opter_journey/sent_request_screen.dart';


class KSlider extends StatelessWidget {
  const KSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 250.0,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 32,),
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI8kzV6oFqQXazwzNX2_skosGLKr3VYuxEQA&s'), // Replace with actual image URL
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Keshav Arya',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const Text(
                    'View activity',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      // Edit profile action
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomListTile(
              icon: "assets/icons/deal_icon.png",
              color: Colors.blue,
              text: 'My Deals',
              onTap: () {
                // Action for My Deals
                Scaffold.of(context).closeDrawer();
                Get.to(()=>const HomeScreen());
              },
            ),
            CustomListTile(
              icon: "assets/icons/favrouite_icon.png",
              color: Colors.teal,
              text: 'My Ads Promotions',
              onTap: () {
                // Action for My Ads Promotions
              },
            ),
            CustomListTile(
              icon: "assets/icons/sent_request.png",
              color: Colors.green,
              text: 'Sent Requests',
              onTap: () {
                // Action for Sent Requests
                Scaffold.of(context).closeDrawer();
                Get.to(()=>const SentRequestScreen());
              },
            ),
            CustomListTile(
              icon: "assets/icons/favrouite_icon.png",
              color: Colors.red,
              text: 'Feedback or Ratings',
              onTap: () {
                // Action for Liked Products
                Scaffold.of(context).closeDrawer();
                Get.to(()=>const OptedProductsScreen());
              },
            ),
            CustomListTile(
              icon: "assets/icons/contact_us.png",
              color: Colors.red,
              text: 'Contact Us',
              onTap: () {
                // Action for Liked Products
                Scaffold.of(context).closeDrawer();
                Get.to(()=>const ContactUsScreen());
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
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                ),
                onPressed: () {
                  // Sign out action
                },
                icon: const Icon(Icons.logout),
                label: const Text('Sign Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KSliderLister extends StatelessWidget {
  const KSliderLister({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              height: 250.0,
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 32,),
                  const CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTI8kzV6oFqQXazwzNX2_skosGLKr3VYuxEQA&s'), // Replace with actual image URL
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Virat Arya',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const Text(
                    'View activity',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.white),
                    onPressed: () {
                      // Edit profile action
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomListTile(
              icon: "",
              color: Colors.blue,
              text: 'My Deals',
              onTap: () {
                // Action for My Deals
              },
            ),
            CustomListTile(
              icon: "",
              color: Colors.teal,
              text: 'My Ads Promotions',
              onTap: () {
                // Action for My Ads Promotions
              },
            ),
            CustomListTile(
              icon: "",
              color: Colors.green,
              text: 'Sent Requests',
              onTap: () {
                // Action for Sent Requests
              },
            ),
            CustomListTile(
              icon: "",
              color: Colors.red,
              text: 'Liked Products',
              onTap: () {
                // Action for Liked Products
              },
            ),
            CustomListTile(
              icon: "",
              color: Colors.grey,
              text: 'Settings',
              onTap: () {
                // Action for Settings
              },
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                ),
                onPressed: () {
                  // Sign out action
                },
                icon: const Icon(Icons.logout),
                label: const Text('Sign Out'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String icon;
  final Color color;
  final String text;
  final VoidCallback onTap;

  const CustomListTile({
    required this.icon,
    required this.color,
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 5,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Image.asset(icon,width: 42,height: 42,),
          title: Text(text),
          onTap: onTap,
        ),
      ),
    );
  }
}