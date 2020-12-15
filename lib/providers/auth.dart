import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:foodapps/widgets/notification_text.dart';

enum Status { Uninitialized, Authenticated, Authenticating, Unauthenticated }

class AuthProvider with ChangeNotifier {

  Status _status = Status.Uninitialized;
  String _token;
  NotificationText _notification;

  Status get status => _status;
  String get token => _token;
  NotificationText get notification => _notification;

  final String api = 'https://cheetah-xpresscorporation.com/foodapi/api';

  initAuthProvider() async {
    String token = await getToken();
    if (token != null) {
      _token = token;
      _status = Status.Authenticated;
    } else {
      _status = Status.Unauthenticated;
    }
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    _status = Status.Authenticating;
    _notification = null;
    notifyListeners();

    final url = "$api/login";

    Map<String, String> body = {
      'username': username,
      'password': password,
    };

    final response = await http.post(url, body: body,);

    if (response.statusCode == 200) {
      Map<String, dynamic> apiResponse = json.decode(response.body);

      _status = Status.Authenticated;
      _token = apiResponse['access_token'];
      print(apiResponse);
      await storeUserData(apiResponse);
      notifyListeners();
      return true;
    }

    if (response.statusCode == 401) {
      _status = Status.Unauthenticated;
      _notification = NotificationText('Invalid email or password.');
      notifyListeners();
      return false;
    }

    _status = Status.Unauthenticated;
    _notification = NotificationText('Server error.');
    notifyListeners();
    return false;
  }

  Future<Map> register(String name, String username, String password, String passwordConfirm,String role) async {
    final url = "$api/register";

    Map<String, String> body = {
      'name': name,
      'username': username,
      'password': password,
      'password_confirmation': passwordConfirm,
      'role':"customer"

    };

    Map<String, dynamic> result = {
      "success": false,
      "message": 'Unknown error.'
    };

    final response = await http.post( url, body: body, );

    if (response.statusCode == 200) {
      _notification = NotificationText('Registration successful, please log in.', type: 'info');
      notifyListeners();
      result['success'] = true;
      return result;
    }

    Map apiResponse = json.decode(response.body);

    if (response.statusCode == 422) {
      if (apiResponse['errors'].containsKey('username')) {
        result['message'] = apiResponse['errors']['username'][0];
        return result;
      }

      if (apiResponse['errors'].containsKey('password')) {
        result['message'] = apiResponse['errors']['password'][0];
        return result;
      }

      return result;
    }

    return result;
  }

  Future<bool> passwordReset(String username) async {
    final url = "$api/forgot-password";

    Map<String, String> body = {
      'username': username,
    };

    final response = await http.post( url, body: body, );

    if (response.statusCode == 200) {
      _notification = NotificationText('Reset sent. Please check your inbox.', type: 'info');
      notifyListeners();
      return true;
    }

    return false;
  }

  storeUserData(apiResponse) async {
    SharedPreferences storage = await SharedPreferences.getInstance();
   await storage.setString('token', apiResponse['access_token']);
   await storage.setString('name', apiResponse['user']['name']);
  }

  Future<String> getToken() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    String token = storage.getString('token');
    return token;
  }

  logOut([bool tokenExpired = false]) async {
    _status = Status.Unauthenticated;
    if (tokenExpired == true) {
      _notification = NotificationText('Session expired. Please log in again.', type: 'info');
    }
    notifyListeners();

    SharedPreferences storage = await SharedPreferences.getInstance();
    await storage.clear();
  }

}