import 'package:shared_preferences/shared_preferences.dart';


class HelperFunction{
  static String userLoggedInKey = "LOGGEDINKEY";
  static String userNameKey = "USERNAMEKEY";
  static String userEmailKey = "USERMAILKEY";

  static Future<bool?> getUserLoggedInStatus()async {
    SharedPreferences sf = await SharedPreferences.getInstance();
    return sf.getBool(userLoggedInKey);
  } 
}