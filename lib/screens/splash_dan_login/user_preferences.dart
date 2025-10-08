import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static Future<void> saveUserData(String username, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", username);
    await prefs.setString("email", email);
    await prefs.setString("password", password);
  }

  static Future<Map<String, String?>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      "username": prefs.getString("username"),
      "email": prefs.getString("email"),
      "password": prefs.getString("password"),
    };
  }

  static Future<bool> checkLogin(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString("email");
    String? savedPassword = prefs.getString("password");
    return (email == savedEmail && password == savedPassword);
  }

  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
