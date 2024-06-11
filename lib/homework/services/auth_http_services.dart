import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthHttpServices {
  final String _apiKey = "AIzaSyC0ZH3nP2gomgZ9XOK4M2_udGOaotG10ss";

  Future<void> _authenticate(
      String email,
      String password,
      String query,
      ) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:$query?key=$_apiKey");

    try {
      final response = await http.post(
        url,
        body: jsonEncode(
          {
            "email": email,
            "password": password,
            "returnSecureToken": true,
          },
        ),
      );
      final data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw (data['error']['message']);
      }

      SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
      await sharedPreferences.setString("token", data['idToken']);
      await sharedPreferences.setString("userId", data['localId']);
      DateTime expiryDate = DateTime.now().add(
        Duration(seconds: int.parse(data['expiresIn'])),
      );
      await sharedPreferences.setString("expiryDate", expiryDate.toString());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(String email, String password) async {
    await _authenticate(email, password, "signUp");
  }

  Future<void> login(String email, String password) async {
    await _authenticate(email, password, "signInWithPassword");
  }

  Future<void> resetPassword() async {
    Uri url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key=$_apiKey');
    final http.Response response = await http.post(url, body: {
      'requestType': "PASSWORD_RESET",
      'email': 'isroilkhasanov0727@gmail.com'
    });
  }

  Future<bool> checkAuth() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString("token");

    if (token == null) {
      return false;
    }

    DateTime expiryDate =
    DateTime.parse(sharedPreferences.getString("expiryDate")!);

    //? check token expiration date
    return expiryDate.isAfter(DateTime.now());
  }

  static void logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }
}
