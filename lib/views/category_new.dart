import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class YourFeedBack extends StatefulWidget {
  const YourFeedBack({super.key});

  @override
  State<YourFeedBack> createState() => _YourFeedBackState();
}

class _YourFeedBackState extends State<YourFeedBack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Card(
              color: Colors.white,
              elevation: 2,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40), // Bottom right corner radius
                ),
              ),
              child: Container(
                width: double.infinity, // Match parent width
                padding: EdgeInsets.zero,
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Wrap content height
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(left: 20.0, top: 40.0),
                      child: Row(
                        children: [
                          Image(
                            width: 80,
                            height: 40,
                            image: AssetImage("assets/images/subnex_logo.png"),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          padding: const EdgeInsets.only(left: 20.0, top: 0.0),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.blue,
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.pop(context); // Navigate back
                          },
                        ),
                      ],
                    ),

                    _wCard()
                  ],
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                     Card(
                      color: Colors.white,
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, top: 30, bottom: 15),
                      elevation: 1,
                      child: Row(
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: 14, bottom: 14),
                            child: Image(
                              height: 32,
                              width: 32,
                              image: AssetImage("assets/icons/login_icon.png"),
                              fit: BoxFit
                                  .cover, // Ensures the image covers the circular area properly
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, top: 8, bottom: 8),
                            child: Text(
                              "My Deals",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Card(
                      color: Colors.white,
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 15),
                      elevation: 1,
                      child: Row(
                        children: [
                          ClipOval(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 15, top: 8, bottom: 8),
                              child: Image(
                                height: 55,
                                width: 55,
                                image:
                                    AssetImage("assets/icons/login_icon.png"),
                                fit: BoxFit
                                    .cover, // Ensures the image covers the circular area properly
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: 8, bottom: 8),
                            child: Text(
                              "Sent Requests",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Card(
                      color: Colors.white,
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 15),
                      elevation: 1,
                      child: Row(
                        children: [
                          ClipOval(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 15, top: 8, bottom: 8),
                              child: Image(
                                height: 55,
                                width: 55,
                                image:
                                    AssetImage("assets/icons/login_icon.png"),
                                fit: BoxFit
                                    .cover, // Ensures the image covers the circular area properly
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: 8, bottom: 8),
                            child: Text(
                              "Request Product",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Card(
                      color: Colors.white,
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 15),
                      elevation: 1,
                      child: Row(
                        children: [
                          ClipOval(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 15, top: 8, bottom: 8),
                              child: Image(
                                height: 55,
                                width: 55,
                                image: AssetImage("assets/icons/login_icon.png"),
                                fit: BoxFit
                                    .cover, // Ensures the image covers the circular area properly
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: 8, bottom: 8),
                            child: Text(
                              "Opted Products",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                    const Card(
                      color: Colors.white,
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 15, bottom: 15),
                      elevation: 1,
                      child: Row(
                        children: [
                          ClipOval(
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 15, top: 8, bottom: 8),
                              child: Image(
                                height: 55,
                                width: 55,
                                image: AssetImage("assets/icons/login_icon.png"),
                                fit: BoxFit
                                    .cover, // Ensures the image covers the circular area properly
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: 15, top: 8, bottom: 8),
                            child: Text(
                              "Feedback/Rating",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        print('coming soon');
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        iconColor: Colors.white,
                        // Text color
                        side: const BorderSide(
                          color: Colors.red, // Red border color
                          width: 2, // Border width
                        ),
                        elevation: 2,
                        // Elevation for shadow effect
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(8), // Rounded corners
                        ),
                      ),
                      child: const Text('Log Out'),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  _wCard(){
    return const Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    'Lorem Ipsum',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Text(
                    'Lorempsum@gmail.com',
                    style: TextStyle(
                        color: Colors.black, fontSize: 14),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'View Profile',
                  style: TextStyle(
                      color: Colors.blue, fontSize: 14),
                ),
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                    ),
                    ClipOval(
                      child: Padding(
                        padding:
                        EdgeInsets.only(left: 4, top: 1),
                        child: Image(
                          height: 8,
                          width: 8,
                          image: AssetImage(
                              "assets/images/camera_img.png"),
                          fit: BoxFit
                              .cover, // Ensures the image covers the circular area properly
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerRight,
          child: ClipOval(
            child: Padding(
              padding: EdgeInsets.only(
                  left: 0, top: 8, bottom: 8, right: 20),
              child: Image(
                  height: 85,
                  width: 85,
                  image: AssetImage(
                      "assets/images/camera_img.png")
                // Ensures the image covers the circular area properly
              ),
            ),
          ),
        ),
      ],
    );
  }

}
