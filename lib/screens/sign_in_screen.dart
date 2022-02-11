import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_getx_flutter/screens/product_overview_screen.dart';
import 'package:shopping_getx_flutter/utils/authentication.dart';
import 'package:shopping_getx_flutter/widget/google_sign_in_button.dart';
import 'package:shopping_getx_flutter/widget/rounded_button.dart';
import 'package:shopping_getx_flutter/res/custom_colors.dart';
// import 'package:flutterfire_samples/utils/authentication.dart';
// import 'package:flutterfire_samples/widgets/google_sign_in_button.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _auth = FirebaseAuth.instance; //variable is private
  bool showSpinner = false;
  String email = "bunty@gmail.com";
  String password = "bunty123";

  User? result = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.firebaseAmber,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 10.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        'assets/start.jpg',
                        height: 220,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Welcome to ',
                      style: TextStyle(
                        color: CustomColors.firebaseNavy,
                        fontSize: 30,
                      ),
                    ),
                    Text(
                      'SUSWAAD APP',
                      style: TextStyle(
                        color: CustomColors.firebaseRed,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'A Fresh Food Available at College Canteen',
                      style: TextStyle(
                        color: CustomColors.firebaseGrey,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: Authentication.initializeFirebase(context: context),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Error initializing Firebase');
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return GoogleSignInButton();
                  }
                  return CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      CustomColors.firebaseOrange,
                    ),
                  );
                },
              ),

              // kRoundedButton(
              //   title: 'Log In',
              //   color: Colors.lightBlueAccent,
              //   onPressed: () async {
              //     //Implement login functionality.
              //     setState(() {
              //       showSpinner = true;
              //     });
              //
              //     try {
              //       final newUser = await _auth.signInWithEmailAndPassword(
              //           email: email, password: password);
              //       if (newUser != null) {
              //         Navigator.pushReplacement(
              //             context,
              //             MaterialPageRoute(
              //                 builder: (context) => ProductOverviewPage()));
              //       } else {
              //         print("skdjncsjdnvndv;ndvndvondvnvnwvn");
              //       }
              //       setState(() {
              //         showSpinner = false;
              //       });
              //     } catch (e) {
              //       print(e);
              //     }
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
