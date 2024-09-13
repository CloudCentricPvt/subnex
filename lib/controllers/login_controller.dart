import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sublet/models/authentication/login/login_response.dart';

import '../utils/constants/api_container.dart';
import '../utils/popups/k_material_dialogs.dart';

class LoginController {
  final _loginModel = LoginResponse();

  Future<Map<String, dynamic>> login(BuildContext context, String mobileNumber) async {

    var validationErr = _loginModel.validateNumber(mobileNumber);
    if(validationErr != null){
      KMaterialDialogs.validationCheck(context, "Validation Error", validationErr);
      return {
        "" : ""
      };
    }

    var body = {"mobile": mobileNumber};
    return await _loginModel.login(body,KApiEndPoints.LOGIN);  // Returns the response map (success, message, etc.)
  }


}
