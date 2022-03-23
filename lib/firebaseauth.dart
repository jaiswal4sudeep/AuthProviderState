import 'package:authstate/homepage.dart';
import 'package:authstate/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthProvider {
  final FirebaseAuth auth;

  AuthProvider(this.auth);

  Stream<User?> get authState => auth.idTokenChanges();

  createAccount(email, password, context) async {
    UserCredential? user;

    try {
      user = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    if (user != null) {
      Fluttertoast.showToast(msg: "Welcome").then(
        (value) => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false),
      );
    }
  }

  signIn(email, password, context) async {
    UserCredential? user;
    try {
      user = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
    if (user != null) {
      Fluttertoast.showToast(msg: "Welcome Back").then(
        (value) => Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        ),
      );
    }
  }

  signOut(context) async {
    try {
      await auth.signOut().then((value) => Navigator.of(context)
          .pushReplacement(
              MaterialPageRoute(builder: (context) => const SignInPage())));
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
}
