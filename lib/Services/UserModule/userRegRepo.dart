import 'dart:convert';
import 'package:easydiagno/Constants/Colors.dart';
import 'package:easydiagno/Models/UserModel/userRegistration.dart';
import 'package:http/http.dart' as http;

Future<bool> userRegistrationApi(UserRegistrationModel userReg) async {
  try {
    final response = await http.post(
      Uri.parse('$baseUrl/user'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        "email": userReg.email,
        "password": userReg.password,
        "name": userReg.name
      }),
    );

    if (response.statusCode == 200) {
       final _body = jsonDecode(response.body);
       if (_body['task'] == 'success') {
         return true;
       }
       return false;
    } else {
      return false;
    }
  } catch (e) {
    print("Registration error: $e");
    return false; 
  }
}
