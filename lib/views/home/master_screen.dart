import 'package:flutter/material.dart';
import 'package:sublet/views/home/home_screen.dart';
import '../../../utils/constants/k_colors.dart';
import '../../utils/helpers/helper_functions.dart';
import '../chats/chat_screen.dart';
import '../common_views/notification_screen.dart';
import '../opter_journey/liked_product_screen.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({super.key});

  @override
  State<MasterScreen> createState() => _MasterScreenState();
}

class _MasterScreenState extends State<MasterScreen> {
  int _currentIndex = 0;
  int notificationCount = 0;
  final navigateTo = [
    const HomeScreen(),
    const ChatScreen(),
    const LikedProductScreen(),
    const NotificationScreen()
  ];

  @override
  void initState() {
    //getNotificationCount();
    super.initState();
  }

  /*Future<void> getNotificationCount() async {
    final localStorage = GetStorage();
    var auth = localStorage.read("Auth_Token");
    var userId = localStorage.read("User_Id");
    final headers = {
      'AuthToken': auth!.toString(),
      'UserId': userId!.toString()
    };
    final response = await https
        .get(
          Uri.parse(KApiEndPoints.NOTIFICATIONS),
          headers: headers,
        )
        .timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      setState(() {});
      var _data = json.decode(response.body);
      var notificationResponse = NotificationResponse.fromJson(_data);
      var notificationList = notificationResponse.notificationList!;
      notificationCount = 0;
      if (notificationList.isNotEmpty) {
        for (int i = 0; i <= notificationList.length - 1; i++) {
          if (notificationList[i].isRead! == 0) {
            setState(() {
              notificationCount++;
            });
          }
        }
      }
    } else {
      throw Exception('Failed to load data');
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: navigateTo[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: KHelperFunctions.isDarkMode(context)
            ? KColors.appPrimaryIndigo
            : KColors.appPrimaryIndigo,
        elevation: 2,
        currentIndex: _currentIndex,
        iconSize: 24,
        selectedFontSize: 14,
        selectedIconTheme: const IconThemeData(size: 26),
        unselectedIconTheme: const IconThemeData(size: 21),
        unselectedFontSize: 11,
        selectedLabelStyle: const TextStyle(color: Colors.black),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        selectedItemColor: KHelperFunctions.isDarkMode(context)
            ? Colors.red
            : KColors.appPrimary,
        unselectedItemColor: KHelperFunctions.isDarkMode(context)
            ? Colors.white
            : Colors.black54,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
           BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: KColors.appPrimaryGrey),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat),
              label: "Chats",
              backgroundColor: KColors.appPrimaryGrey),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "Liked",
              backgroundColor: KColors.appPrimaryGrey),
          BottomNavigationBarItem(
              icon: Badge(
                backgroundColor: KColors.appPrimary,
                label: Text(
                  '$notificationCount',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white),
                ),
                child: const Icon(Icons.notifications),
              ),
              label: "Notifications",
              backgroundColor: KColors.appPrimaryGrey),
        ],
        onTap: (index) {
          /*setState(() {
            _currentIndex = index;
            //getNotificationCount();
          });*/
        },
      ),
    );
  }
}
