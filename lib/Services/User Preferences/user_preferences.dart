import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences {
  static SharedPreferences? _preferences;
  static const _keyUserName = 'username';
  static const _keyIslogedIn = 'islogedin';
   static const _keyUserId = 'userid';
  static const _keyUserEmail = 'userEmail';
  static const _keyUserPhone = 'userPhone';

  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();

  static Future setUsername(String userName) async =>
      await _preferences!.setString(_keyUserName, userName);

  static String? getUsername() => _preferences!.getString(_keyUserName);

  static Future setLogin(String isLogin) async =>
      await _preferences!.setString(_keyIslogedIn, isLogin);

  static String? getLogin() => _preferences!.getString(_keyIslogedIn);

  static Future setUserId(int userId) async =>
      await _preferences!.setInt(_keyUserId, userId);
  static int? getUserId() => _preferences!.getInt(_keyUserId);

  static Future setUserEmail(String userEmail) async =>
      await _preferences!.setString(_keyUserEmail, userEmail);
  static String? getUserEmail() => _preferences!.getString(_keyUserEmail);

  static Future setUserPhone(String userPhone) async =>
      await _preferences!.setString(_keyUserPhone, userPhone);
  static String? getUserPhone() => _preferences!.getString(_keyUserPhone);



}