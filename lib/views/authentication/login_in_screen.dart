import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:subnex/utils/constants/k_images.dart';
import 'package:subnex/views/authentication/otp_screen.dart';

import '../../../utils/constants/k_colors.dart';
import '../../controllers/login_controller.dart';
import 'country_code_picker.dart';

class LoginInScreen extends StatefulWidget {
  const LoginInScreen({super.key});

  @override
  State<LoginInScreen> createState() => _LoginInScreenState();
}

class _LoginInScreenState extends State<LoginInScreen> {
  bool _isLoading = false;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController _mobileNumController = TextEditingController();
  final LoginController _loginController = LoginController();

  // Function to handle login action
  void _handleLogin() async {
    setState(() {
      _isLoading = true; // Show progress bar
    });

    String number = _mobileNumController.text;
    Map<String, dynamic> response = await _loginController.login(context, number);
    if(response['status'] == true){
      Get.to((() => OtpScreen(number: _mobileNumController.text,otp: response['otp'])));
    }else{
      log("LoginScreen : ${response['message']}");
    }

    setState(() {
      _isLoading = false; // Hide progress bar
    });
  }

  @override
  void dispose() {
    _mobileNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              // Add space at the top for the image to overlap
              const SizedBox(height: 56),
              Expanded(
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 80, left: 20.0, right: 20.0),
                        child: Text(
                          'Please enter your Registered Mobile Number',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                child: Container(
                  color: Colors.grey[100],
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const CountryCodePicker(),
                          const SizedBox(width: 12),
                          _wEdtNumber()
                        ],
                      ),
                      const SizedBox(height: 20),
                      _wGetOtp(),
                      const SizedBox(height: 20),
                      _wTxtTermAndCondition()
                    ],
                  ),
                ),
              ),
            ],
          ),

          // The AppBar
          Positioned(
            top: -20,
            left: 0,
            right: 0,
            child: AppBar(
              leading: Container(),
              title: Center(
                  child: Padding(
                padding: const EdgeInsets.only(right: 60.0),
                child: Text('Login',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(fontSize: 20)),
              )),
              backgroundColor: Colors.transparent, // Make AppBar transparent
              elevation: 0, // Remove AppBar shadow
            ),
          ),

          // The circle image
          Positioned(
            top: -80, // Adjust the position
            left: MediaQuery.of(context).size.width / 2 -
                80, // Center horizontally
            child: Image.asset(
              KImageStrings.login_bg_circle, // Replace with your image path
              width: 300,
              height: 500,
            ),
          ),
        ],
      ),
    );
  }

  _wEdtNumber() {
    return Expanded(
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
        child: Center(
          child: Form(
            key: loginFormKey,
            child: TextFormField(
              cursorErrorColor: KColors.appSecondaryGrey,
              cursorColor: KColors.appSecondaryGrey,
              controller: _mobileNumController,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                errorText: null,
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w300),
                contentPadding: const EdgeInsets.all(16),
                hintText: 'Registered Number',
              ),
            ),
          ),
        ),
      ),
    );
  }

  _wGetOtp() {
    return _isLoading
        ? const CircularProgressIndicator(color: Colors.black54)
        : _wBtnGetOtp();
  }

  _wBtnGetOtp() {
    return SizedBox(
      width: Get.size.width * 0.9,
      height: 58,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: () {
          _handleLogin();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Get OTP',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: KColors.appSecondaryGrey),
          ),
        ),
      ),
    );
  }

  _wTxtTermAndCondition() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Text.rich(
        textAlign: TextAlign.center,
        TextSpan(
          children: [
            TextSpan(
              text: 'By continuing you Agree to our \n',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Navigate to Terms & Conditions
                },
              text: 'Terms & Condition',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: KColors.appPrimaryBlue),
            ),
            TextSpan(
              text: ' and ',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Navigate to Privacy Policy
                },
              text: 'Privacy Policy',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .apply(color: KColors.appPrimaryBlue),
            ),
          ],
        ),
      ),
    );
  }
}
