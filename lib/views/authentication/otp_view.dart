import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:subnex/models/authentication/login/otp_verification_response.dart';

class OTPView extends StatefulWidget {
  //final OtpResponse model;

  //OTPView({required this.model});

  @override
  _OTPViewState createState() => _OTPViewState();
}

class _OTPViewState extends State<OTPView> with CodeAutoFill {
  final _otpController = TextEditingController();
  bool _isResendEnabled = true;

  @override
  void initState() {
    super.initState();
    listenForCode();
  }

  @override
  void codeUpdated() {
    final code = this.code; // Get the code from the CodeAutoFill mixin
    if (code != null) {
      log("Code If");
      //widget.model.setOTP(code);
      _otpController.text = code;
      _verifyOTP();
    }else{
      log("Code Else");
    }
  }

  Future<void> _verifyOTP() async {
    // bool success = await widget.model.verifyOTP();
    // if (success) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('OTP Verified!')));
    // } else {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid OTP!')));
    // }
  }

  Future<void> _resendOTP() async {
    // setState(() {
    //   _isResendEnabled = false;
    // });
    // await widget.model.resendOTP();
    // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('OTP has been resent!')));
    // Future.delayed(const Duration(seconds: 30), () {
    //   setState(() {
    //     _isResendEnabled = true;
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enter OTP')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PinFieldAutoFill(
              controller: _otpController,
              codeLength: 6,
              onCodeChanged: (code) {
               // widget.model.setOTP(code ?? '');
                _verifyOTP();
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verifyOTP,
              child: const Text('Verify OTP'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isResendEnabled ? _resendOTP : null,
              child: const Text('Resend OTP'),
            ),
          ],
        ),
      ),
    );
  }
}
