import 'dart:convert';

import 'package:easydiagno/Constants/Colors.dart';
import 'package:easydiagno/Models/UserModel/loginModel.dart';
import 'package:easydiagno/Models/UserModel/loginResponce.dart';
import 'package:http/http.dart' as http;

Future<LoginResponce?> userLoginApi(UserLoginmodel userlogin) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/login_check'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "email": userlogin.email,
        "password": userlogin.password
      }),
    );

    print("login responce ${response.body}");
    print(response.statusCode);

    if (response.statusCode == 200) {
      final _body = jsonDecode(response.body);
      // Check if task is success
      if (_body['task'] == 'success') {
          final resp = LoginResponce.fromJson(_body);
          return resp;
      } else {
          print("Login failed: ${_body['msg']}");
          return null;
      }
    } else {
      print("else");
      print(response.statusCode);
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
}
