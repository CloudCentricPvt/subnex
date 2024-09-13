import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:subnex/models/authentication/login/otp_verification_response.dart';

import '../utils/constants/api_container.dart';
import '../utils/popups/k_material_dialogs.dart';

class OTPController {
  final _model = OtpVerificationResponse();

  Future<Map<String, dynamic>> verifyOtp(BuildContext context, String mobileNumber, String otp) async {
    var validationErr = _model.validateEnteredOtp(otp);
    var body = {
      "mobile": mobileNumber,
      "otp":otp
    };

    if(validationErr != null){
      KMaterialDialogs.validationCheck(context, "Validation Error", validationErr);
      return {
        "" : ""
      };
    }

    return await _model.validateOtp(body,KApiEndPoints.OTP_VERIFICATION);  // Returns the response map (success, message, etc.)
  }

  Future<Map<String, dynamic>> resendOtp(BuildContext context, String mobileNumber) async {
    var validationErr = _model.validateEnteredNumber(mobileNumber);
    var body = {"mobile": mobileNumber};

    if(validationErr != null){
      KMaterialDialogs.validationCheck(context, "Validation Error", validationErr);
      return {
        "" : ""
      };
    }

    return await _model.resendOtp(body, KApiEndPoints.RESEND_OTP);  // Returns the response map (success, message, etc.)
  }

}
