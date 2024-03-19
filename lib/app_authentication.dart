import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vitafit/main.dart';
import 'core/helper/custom_snack_bar.dart';

class AppAuthentication {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  Future<void> loginUser(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const HomePage();
        },
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // ignore: use_build_context_synchronously
        customSnackBar(context, message: 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        // ignore: use_build_context_synchronously
        customSnackBar(context,
            message: 'Wrong password provided for that user.');
      } else {
        // ignore: use_build_context_synchronously
        customSnackBar(context, message: 'The email or password is wrong');
      }
    }
  }

  Future<void> signUpUser(
      {required String fullName,
      required String phoneNumber,
      required String email,
      required String location,
      required String programPrice,
      required String availability,
      required String description,
      required String password,
      required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      await users.add({
        'image': '',
        'fullName': fullName.trim(),
        'phoneNumber': phoneNumber.trim(),
        'email': email.trim(),
        'location': location.trim(),
        'programPrice': programPrice.trim(),
        'availability': availability.trim(),
        'description': description.trim(),
        'attestation': ''
      });
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const HomePage();
        },
      ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // ignore: use_build_context_synchronously
        customSnackBar(context, message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        // ignore: use_build_context_synchronously
        customSnackBar(context,
            message: 'The account already exists for that email.');
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      customSnackBar(context, message: e.toString());
    }
  }
}
