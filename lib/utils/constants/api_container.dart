class KApiContainer {
  KApiContainer._();

  static String BASE_URL = "http://dev2.cccinfotech.com:3000/";
  static var api = "${BASE_URL}api/";
  static KApiEndPoints kApiEndPoints = KApiEndPoints();
}

class KApiEndPoints {

  /// -- Authentication
  static String LOGIN = "${KApiContainer.api}user/login";
  static String FORGOT_PASSWORD = KApiContainer.api;
  static String OTP_VERIFICATION = "${KApiContainer.api}user/otp-verified";
  static String RESEND_OTP = "${KApiContainer.api}user/resend-otp";
  static String AUTH_CHECK = "${KApiContainer.api}auth-check";

  /// -- Home


  /// -- User Profile
  static String USER_PROFILE_DETAIL = "${KApiContainer.api}user/detail/";
  static String USER_PROFILE_UPDATE = "${KApiContainer.api}user/update";
  static String GUIDELINES = "${KApiContainer.api}guideline-privacy-policy";
  static String NEED_SUPPORT = "${KApiContainer.api}support";


  static String CATEGORY_LIST = "${KApiContainer.api}category-list";
  static String SUB_CATEGORY_LIST = "${KApiContainer.api}sub-category-list/";

  /// -- Notification
  static String NOTIFICATIONS = "${KApiContainer.api}notification-list";
  static String UPDATE_ISREAD_NOTIFICATION = "${KApiContainer.api}notification-read";

}
