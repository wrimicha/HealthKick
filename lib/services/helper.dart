import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static String sharedPreferenceUserName = "USERNAME";
  static String sharedPreferenceUserEmail = "USEREMAIL";

  static Future<void> saveUserName(String username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserName, username);
  }

  static Future<void> saveUserEmail(String email) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(sharedPreferenceUserEmail, email);
  }

  //getting the data from shared preference
  static Future<String> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserName);
  }

  static Future<String> getUserEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(sharedPreferenceUserEmail);
  }
}
