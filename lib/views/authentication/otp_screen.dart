import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:subnex/controllers/otp_controller.dart';
import 'package:subnex/utils/constants/k_images.dart';
import 'package:subnex/views/authentication/login_in_screen.dart';
import 'package:subnex/views/authentication/sign_in_screen.dart';
import 'package:subnex/views/home/master_screen.dart';

import '../../../utils/constants/k_colors.dart';
import '../categories/category_screen.dart';
import '../home/home_screen.dart';

class OtpScreen extends StatefulWidget {
  final String? number;
  final String? otp;

  const OtpScreen({super.key, this.number, this.otp});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen>
    with SingleTickerProviderStateMixin {
  bool _isLoading = false;
  final _localStorage = GetStorage();
  final FocusNode _focusNodePin1 = FocusNode();
  final OTPController _otpController = OTPController();
  final TextEditingController pin1 = TextEditingController();
  final TextEditingController pin2 = TextEditingController();
  final TextEditingController pin3 = TextEditingController();
  final TextEditingController pin4 = TextEditingController();

  // -- Resend OTP
  late AnimationController _controller;
  int _timerDuration = 60;
  late Timer _timer;
  late String otp;

  @override
  void dispose() {
    _controller.dispose();
    pin1.dispose();
    pin2.dispose();
    pin3.dispose();
    pin4.dispose();
    super.dispose();
  }

  @override
  void initState() {
    otp = "";
    if (widget.otp != null) {
      otp = widget.otp!;
    }
    _start();
    _startTimer();
    super.initState();
  }

  _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _timerDuration--;
      });
      if (_timerDuration < 1) {
        _timer.cancel();
      }
    });
  }

  _stopTimer(){
    if(_timer.isActive){
      _timer.cancel();
    }
  }

  _start() {
    _controller = AnimationController(vsync: this, duration: Duration(seconds: _timerDuration));
    _controller.forward();
  }

  // --  Function to handle Resend OTP
  void _handleResendOtp() async {
    setState(() {
      _isLoading = true; // Show progress bar
    });

    String number = widget.number!;
    Map<String, dynamic> response = await _otpController.resendOtp(context, number);
    if (response['status'] == true) {
      setState(() {
        otp = response['otp'];
      });
    } else {
      log("OtpScreen -> ResendOtp : ${response['message']}");
    }

    setState(() {
      _isLoading = false; // Hide progress bar
    });
  }

  // -- Function to handle OTP Verification
  void _handleOtpVerification() async {
    setState(() {
      _isLoading = true; // Show progress bar
    });

    String pin_1 = pin1.text;
    String pin_2 = pin2.text;
    String pin_3 = pin3.text;
    String pin_4 = pin4.text;
    String finalPin = pin_1 + pin_2 + pin_3 + pin_4;
    String? number = widget.number;

    Map<String, dynamic> response = await _otpController.verifyOtp(context, number!, finalPin);

    if (response['status'] == true) {
      _localStorage.write("Auth_Token", response['auth_token']);
      _localStorage.write("User_Id", response['user_code']);
      _localStorage.write("Is_Login_Done", true);
      Get.offAll((() => const HomeScreen()));
    } else {
      if (response['message'] != null) {
        pin1.clear();
        pin2.clear();
        pin3.clear();
        pin4.clear();
        _focusNodePin1.requestFocus();
        Fluttertoast.showToast(
            msg: response['message'],
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 2,
            textColor: Colors.white,
            backgroundColor: Colors.black,
            fontSize: 16.0);
      }
    }

    setState(() {
      _isLoading = false; // Hide progress bar
    });
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
                        padding: const EdgeInsets.only(
                            top: 80, left: 20.0, right: 20.0),
                        child: Text(
                          'We have sent an OTP on your Registered Mobile Number --> $otp',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  fontSize: 22, fontWeight: FontWeight.w500),
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 20),
                      _wEdtOTP(),
                      //const SizedBox(height: 12),
                      _wTimerAndResendOTP(),
                      const SizedBox(height: 12),
                      _isLoading
                          ? const CircularProgressIndicator(
                              color: Colors.black54)
                          : _wBtnVerifyOTP(),
                      const SizedBox(height: 20),
                      _wTxtChangeNumber()
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// AppBar login txt
          _wTxtAppBar(),

          /// Circle background image
          _wIcCircleBg()
        ],
      ),
    );
  }

  _wTxtAppBar() {
    return Positioned(
      top: -20,
      left: 0,
      right: 60,
      child: AppBar(
        leading: Container(),
        title: Center(
            child: Text('Login',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 20))),
        backgroundColor: Colors.transparent, // Make AppBar transparent
        elevation: 0, // Remove AppBar shadow
      ),
    );
  }

  _wIcCircleBg() {
    return Positioned(
      top: -80, // Adjust the position
      left: MediaQuery.of(context).size.width / 2 - 80, // Center horizontally
      child: Image.asset(
        KImageStrings.login_bg_circle, // Replace with your image path
        width: 300,
        height: 500,
      ),
    );
  }

  _wEdtOTP() {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: 60,
            width: 64,
            child: TextFormField(
              controller: pin1,
              focusNode: _focusNodePin1,
              onSaved: (pin) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w300),
                contentPadding: const EdgeInsets.all(16),
                hintText: '_',
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: 64,
            child: TextFormField(
              controller: pin2,
              onSaved: (pin2) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w300),
                contentPadding: const EdgeInsets.all(16),
                hintText: '_',
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: 64,
            child: TextFormField(
              controller: pin3,
              onSaved: (pin3) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w300),
                contentPadding: const EdgeInsets.all(16),
                hintText: '_',
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: 64,
            child: TextFormField(
              controller: pin4,
              onSaved: (pin4) {},
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly
              ],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.w300),
                contentPadding: const EdgeInsets.all(16),
                hintText: '_',
              ),
            ),
          ),
        ],
      ),
    );
  }

  _wTimerAndResendOTP() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //${_timerDuration.minutes.inMinutes.remainder(60).toString()}
          Text("0:${_timerDuration.seconds.inSeconds.remainder(60).toString().padLeft(2, '0')}",style: const TextStyle(
            fontSize: 18,
            color: Colors.black54,
          )),
          /*Countdown(
            animation: StepTween(
              begin: _timerDuration,
              end: 0,
            ).animate(_controller),
          ),*/
          GestureDetector(
            onTap: () {
              _timerDuration == 0 ? _handleResendOtp() : null;
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Text(
                "Resend OTP?",
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      fontWeight: _timerDuration == 0
                          ? FontWeight.w500
                          : FontWeight.w300,
                      decoration: _timerDuration == 0
                          ? TextDecoration.underline
                          : TextDecoration.none,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _wBtnVerifyOTP() {
    return SizedBox(
      width: Get.size.width * 0.91,
      height: 62,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 1,
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: () {
          _handleOtpVerification();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'Verify',
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ),
    );
  }

  _wTxtChangeNumber() {
    return GestureDetector(
      onTap: () {
        Get.off(() => const LoginInScreen());
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Text(
          textAlign: TextAlign.center,
          "Change Number",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: KColors.appPrimary),
        ),
      ),
    );
  }
}

class Countdown extends AnimatedWidget {
  Countdown({super.key, required this.animation})
      : super(listenable: animation);
  Animation<int> animation;

  @override
  build(BuildContext context) {
    Duration clockTimer = Duration(seconds: animation.value);
    String timerText = '${clockTimer.inMinutes.remainder(60).toString()}:${clockTimer.inSeconds.remainder(60).toString().padLeft(2, '0')}';
    //print('Timer  $timerText');
    print('ClockTimer  $clockTimer');
    //print('animation.value  ${animation.value} ');
    //print('inMinutes ${clockTimer.inMinutes.toString()}');
    //print('inSeconds ${clockTimer.inSeconds.toString()}');
    //print('inSeconds.remainder ${clockTimer.inSeconds.remainder(60).toString()}');
    return Text(
      timerText,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black54,
      ),
    );
  }
}
