import 'package:blood/Modals/PostModal.dart';
import 'package:blood/pages/HomePage.dart';
import 'package:blood/pages/MainHomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../pages/SignInPage.dart';

class DataProvider {
  static void posts() async {
    var data = await FirebaseFirestore.instance.collection("Posts").get();
    Post.posts = List.from(data.docs.map((e) => PostModal.fromSnapshot(e)));
  }

  static Future<void> googleSignIn() async {
    User? user;
    final GoogleSignIn googleSignIn = GoogleSignIn();
    GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken);
      try {
        EasyLoading.show();
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        user = userCredential.user;
        await FirebaseFirestore.instance
            .collection("Users")
            .doc(user!.uid)
            .get()
            .then((value) async {
          if (!value.exists) {
            await FirebaseFirestore.instance
                .collection("UserData")
                .doc(user!.uid)
                .set({
              "address": "",
              "contact": user.phoneNumber,
              "email": user.email,
              "name": user.displayName,
              "uid": user.uid,
            }).then((value) {
              Get.snackbar("Sign Up SuccessFul",
                  "${user!.displayName} you can now login",
                  colorText: Colors.white, backgroundColor: Colors.pink);
            });

            Get.to(MainHomePage());
            EasyLoading.dismiss();
          } else {
            Get.to(MainHomePage());
            EasyLoading.dismiss();
          }
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'account-exists-with-different-credential') {
          EasyLoading.showError(e.message.toString());
          print(e.code);
          // handle the error here
        } else if (e.code == 'invalid-credential') {
          EasyLoading.showError(e.message.toString());
          print(e.code);
          // handle the error here
        } else {
          EasyLoading.showError(e.message.toString());
        }
      }
    }
  }
}
