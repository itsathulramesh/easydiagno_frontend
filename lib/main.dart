import 'package:easydiagno/screens/AppHome/Homescreen.dart';
import 'package:easydiagno/screens/Login_Signup/WelcomeScreen.dart';



import 'package:flutter/material.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.blue),
        home: HomeScreen(),

        );
  }
}
