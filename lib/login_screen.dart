import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ledgerpratice/createUserAccoutPage.dart';
import 'package:ledgerpratice/home_screen.dart';
import 'package:ledgerpratice/state_managemnt.dart';

import 'getit_locater.dart';

GoogleSignIn google = GoogleSignIn();
CollectionReference collectionReference = Firestore.instance.collection(
    "UserAccouts");

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isAuth = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    google.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      hangleSignIn(account);

    });
    google.signInSilently().then((GoogleSignInAccount account) {
      hangleSignIn(account);
    });
  }

  hangleSignIn(GoogleSignInAccount account) {
    if (account != null) {
      checkUsersInFireBase();
      setState(() {
        isAuth = true;
      });
    } else {
      setState(() {
        isAuth = false;
      });
    }
  }


  checkUsersInFireBase() async {
    DocumentSnapshot doc = await collectionReference.document(
        google.currentUser.id).get();
    if (!doc.exists) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CreateAccout()),
      );

    }
    // DocumentSnapshot docd = await collectionReference.document(
    //     google.currentUser.id).get();
 // await  locater<LedgerGlobalState>().getUserDetails(docd);
  //  print("calling this funtion ${docd.data()}");
   // locater<LedgerGlobalState>().getUserDetails(docd);
  }

  @override
  Widget build(BuildContext context) {
    return isAuth ? HomeScreen() : unAuthScreen();
    return Scaffold(
      backgroundColor: Colors.amber,
    );
  }

  unAuthScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                googleLogin();
              },
              child: Text(
                "Login",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  googleLogin() {
    print("button is pressed");
    google.signIn();
  }
}
