import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends ChangeNotifier {
  static const _sessionKey = 'is_logged_in';
  static const _usernameKey = 'username';
  static const _validUsername = 'admin';
  static const _validPassword = 'admin';

  bool _isLoggedIn = false;
  String? _username;

  bool get isLoggedIn => _isLoggedIn;
  String? get username => _username;

  Future<void> loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool(_sessionKey) ?? false;
    _username = prefs.getString(_usernameKey);
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    if (username != _validUsername || password != _validPassword) {
      return false;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_sessionKey, true);
    await prefs.setString(_usernameKey, username);

    _isLoggedIn = true;
    _username = username;
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_sessionKey);
    await prefs.remove(_usernameKey);

    _isLoggedIn = false;
    _username = null;
    notifyListeners();
  }
}
