class KValidator {

  static String? requiredField(String? value, String error){
    if(value == null || value == ""){
      return error;
    }
    return null;
  }

  static String? fullNameValidator(String? value){
    if(value == null || value == ""){
      return "Full name is required";
    }
    return null;
  }

  static String? emailValidator(String? value){
    if(value == null || value == ""){
      return "Email is required";
    }

    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailRegExp.hasMatch(value)){
      return "Invalid email address";
    }
    return null;
  }

  static String? phoneValidator(String? value){
    if(value == null || value == ""){
      return "Phone number is required";
    }

    final phoneRegExp = RegExp(r'^\d{10}$');
    if(!phoneRegExp.hasMatch(value)){
      return "Invalid phone number format";
    }
    return null;
  }

  static String? passwordValidator(String? value){
    if(value == null || value == ""){
      return "Password is required";
    }
    if(value.length < 3){
      return "Password must be at lease 3 characters long";
    }
    return null;
  }

}
