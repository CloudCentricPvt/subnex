import 'package:flutter/material.dart';
import 'package:sublet/utils/constants/k_colors.dart';
import 'package:sublet/utils/constants/k_sizes.dart';
import 'package:sublet/utils/reusable_widgets/k_app_bar.dart';

import '../../utils/reusable_widgets/k_custom_app_bar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationsState();
}

class _NotificationsState extends State<NotificationScreen> {

  // Sample data for new and old notifications
  final List<String> newNotifications = [
    "New Notification 1",
    "New Notification 2",
    "New Notification 3"
  ];

  final List<String> oldNotifications = [
    "Old Notification 1",
    "Old Notification 2",
    "Old Notification 3",
    "Old Notification 4",
    "Old Notification 5",
    "Old Notification 6"
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
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0,bottom: 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// --- Back Arrow & App Screen Title
            const KCustomAppBar(screenTitle: "Notifications"),

            const SizedBox(height: 12,),

            /// --- Today Notifications
            _wTodayNotifications(),

            const SizedBox(height: 12,),

            /// --- New Notifications
            _wYesterdayNotifications(),
          ],
        ),
      ),
    );
  }

  _wTodayNotifications() {
    return Expanded(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: const ColoredBox(color:KColors.appPrimaryIndigo,child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 22),
              child: Text("Today"),
            )),
          ),
          const SizedBox(
            height: KSizes.spaceBtwItems_12,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => const Column(
                children: [
                  ListTile(
                    title: Text("Lorem Ipsum"),
                    subtitle: Text("Lorem Ipsum is dummy style used to design from 1500's."),

                  ),
                  Divider()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _wYesterdayNotifications() {
    return Expanded(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: const ColoredBox(color:KColors.appPrimaryIndigo,child: Padding(
              padding: EdgeInsets.symmetric(vertical: 6.0,horizontal: 22),
              child: Text("Yesterday"),
            )),
          ),
          const SizedBox(
            height: KSizes.spaceBtwItems_12,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => const Column(
                children: [
                  ListTile(
                    title: Text("Lorem Ipsum"),
                    subtitle: Text(
                        "Lorem Ipsum is dummy style used to design from 1500's."),
                  ),
                  Divider()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}
