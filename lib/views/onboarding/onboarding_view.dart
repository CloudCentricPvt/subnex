import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sublet/views/authentication/login_in_screen.dart';
import 'package:sublet/views/authentication/sign_in_screen.dart';
import 'onboarding_items.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final _localStorage = GetStorage();
  final controller = OnboardingItems();
  final pageViewController = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    try {
      final localStorage = GetStorage();
      var isOnboardingDone = localStorage.read("Is_Onboarding_Done");
    } catch (e) {
      log("Catch : $e");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  pageViewController.jumpToPage(controller.items.length - 1);
                },
                child: const Text(
                  "Skip",
                  style: TextStyle(
                      //color: KColors.secondaryRedColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                )),

            //Indicator
            SmoothPageIndicator(
              controller: pageViewController,
              count: controller.items.length,
              onDotClicked: (index) => pageViewController.animateToPage(index,
                  duration: const Duration(microseconds: 600),
                  curve: Curves.easeIn),
              effect: const WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: Colors.blueAccent),
            ),

            TextButton(
                onPressed: () {
                  isLastPage
                      ? navigateToHomeScree(context)
                      : pageViewController.nextPage(
                          duration: const Duration(microseconds: 600),
                          curve: Curves.easeIn);
                },
                child: Text(
                  !isLastPage ? "Next" : "Login",
                  style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                )),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
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
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(controller.items[index].image),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      controller.items[index].title,
                      style:
                          const TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      controller.items[index].description,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 17),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }

  // App Entrance Button -> "Get Started"
  Widget showGetStartedButton() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.blueAccent),
      width: MediaQuery.of(context).size.width * 0.9,
      height: 56,
      child: TextButton(
          onPressed: () {
            navigateToHomeScree(context);
          },
          child: const Text(
            "Get Started",
            style: TextStyle(color: Colors.white),
          )),
    );
  }

  void navigateToHomeScree(BuildContext context) {
    _localStorage.write("Is_Onboarding_Done", true);
    Get.to((() => const LoginInScreen()));
  }
}
