import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:sublet/utils/constants/k_images.dart';
import 'package:sublet/utils/helpers/helper_functions.dart';
import 'package:sublet/views/authentication/otp_screen.dart';
import '../../../utils/constants/k_colors.dart';
import '../../utils/popups/k_material_dialogs.dart';
import '../../utils/validators/k_validation.dart';
import 'country_code_picker.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();

}

class _SignInScreenState extends State<SignInScreen> {

  final TextEditingController _mobileNumController = TextEditingController();
  final _localStorage = GetStorage();
  final bool _validate = false;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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
          // The main body of the page
          Column(
            children: <Widget>[
              // Add space at the top for the image to overlap
              const SizedBox(height: 56),
              Expanded(
                child: Stack(
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top:80,left: 20.0,right: 20.0),
                        child: Text(
                          'Please enter your Registered Mobile Number',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(fontSize: 24, fontWeight: FontWeight.w500),
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
                      _wBtnGetOtp(),
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
              title:  Center(child: Text('Login',
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 20))),
              backgroundColor: Colors.transparent, // Make AppBar transparent
              elevation: 0, // Remove AppBar shadow
            ),
          ),

          // The circle image
          Positioned(
            top: -80, // Adjust the position
            left: MediaQuery.of(context).size.width / 2 - 80, // Center horizontally
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

  _wEdtNumber(){
    return Expanded(
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 2,vertical: 0),
        child: Center(
          child: Form(
            key: loginFormKey,
            child: TextFormField(
              cursorErrorColor: KColors.appSecondaryGrey,
              cursorColor: KColors.appSecondaryGrey,
              //validator: (value) => KValidator.requiredField(value, "Please enter mobile number"),
              controller: _mobileNumController,
              inputFormatters: [
                LengthLimitingTextInputFormatter(10),
                FilteringTextInputFormatter.digitsOnly
              ],
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                //errorText: _validate ? "Please enter mobile number" : null,
                errorText: null,
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w300),
                contentPadding: const EdgeInsets.all(16),
                //filled: true,
                //fillColor: Colors.white70,
                hintText: 'Registered Number',
              ),
            ),
          ),
        ),
      ),
    );
  }

  _wBtnGetOtp(){
    return SizedBox(
      width: Get.size.width * 0.9,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: () {
          if(_mobileNumController.text.isEmpty){
            KMaterialDialogs.validationCheck(Get.context!, "Validation Error", "Please enter registered mobile number.");
            return;
          }
          if(_mobileNumController.text.length < 10){
            KMaterialDialogs.validationCheck(Get.context!, "Validation Error", "Please enter 10 digit mobile number.");
            return;
          }
          _localStorage.write("Is_Login_Done", true);
          Get.to((() => OtpScreen(number: _mobileNumController.text)));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Get OTP',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: KColors.appSecondaryGrey),
          ),
        ),
      ),
    );
  }

  _wTxtTermAndCondition(){
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

