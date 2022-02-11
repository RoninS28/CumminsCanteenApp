import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shopping_getx_flutter/screens/login_screen.dart';
import 'package:shopping_getx_flutter/screens/product_overview_screen.dart';
import 'package:shopping_getx_flutter/screens/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Getx Shopping',
      theme: ThemeData(
          primarySwatch: Colors.red,
          accentColor: Colors.deepOrange,
          fontFamily: "Lato"),
      home: SignInScreen(),
    );
  }
}
