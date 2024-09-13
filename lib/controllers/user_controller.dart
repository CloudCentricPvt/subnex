import 'package:flutter/cupertino.dart';
import 'package:subnex/models/authentication/user/user_detail_response.dart';

import '../utils/constants/api_container.dart';

class UserController {

  final _model = UserDetailResponse();

  Future<dynamic> fetchUserDetail(BuildContext context, String userCode) async {
    return await _model.getUserDetail(KApiEndPoints.USER_PROFILE_DETAIL + userCode);  // Returns the response map (success, message, etc.)
  }

  Future<Map<String, dynamic>> updateUserProfileInfo(BuildContext context, var hashMap) async{
    return await _model.updateUserProfile(hashMap, KApiEndPoints.USER_PROFILE_UPDATE);
  }

}