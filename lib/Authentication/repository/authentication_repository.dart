import 'dart:ui';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:jsskos_app/Authentication/Screens/SignIn_email/Sign_in_email_pass.dart';
import 'package:jsskos_app/Authentication/Screens/signup/signUp.dart';
import 'package:jsskos_app/Authentication/repository/exceptions/signup_email_password_failure.dart';
import 'package:jsskos_app/Nav_bars/bottom_nav.dart';
import 'package:jsskos_app/screen/home.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 6));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(
            () => AnimatedSplashScreen(
              splash: Image.asset('assets/images/splash_image.png'),
              duration: 2500,
              splashTransition: SplashTransition.fadeTransition,
              nextScreen: EmailPassSignInScreen(),
            ),
          )
        : Get.offAll(() => AnimatedSplashScreen(
              splash: Image.asset('assets/images/splash_image.png'),
              duration: 2500,
              splashTransition: SplashTransition.fadeTransition,
              nextScreen: MyBottomNav(),
            ));
  }

  Future<void> createUserWithEmailAndPassword(
      String name, String phoneNo, String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      Map<String, dynamic> userInfoMap = {
        "name": name,
        "email": email,
        "phone Number": phoneNo,
        "Admission compleleted": false,
        "token": "",
      };
      Map<String, dynamic> AdmissionuserInfoMap = {
        "Name": name,
        "Email": email,
        "Phone Number": phoneNo,
        "Admission compleleted": false,
        "token": "",
      };

      if (userCredential != null) {
        await FirebaseFirestore.instance
            .collection("AdmittedUsers")
            .doc(_auth.currentUser!.uid)
            .set(AdmissionuserInfoMap);

        await FirebaseFirestore.instance
            .collection("users")
            .doc(_auth.currentUser!.uid)
            .set(userInfoMap)
            .whenComplete(() => {
                  Get.snackbar("Success", "Your account has been created.",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.white,
                      colorText: Colors.green)
                });
        await FirebaseFirestore.instance
            .collection("AdmittedUsers")
            .doc(_auth.currentUser!.uid)
            .set(AdmissionuserInfoMap);
      }

      firebaseUser.value != null
          ? Get.offAll(() => MyBottomNav())
          : Get.to(() => SignUpScreen());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print("FIREBASE AUTH EXCEPTION - ${ex.message}");
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print("Exception - ${ex.message}");
      throw ex;
    }
  }

  Future<void> siginUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => MyBottomNav())
          : Get.to(
              () => AnimatedSplashScreen(
                splash: Image.asset('assets/images/splash_image.png'),
                duration: 2500,
                splashTransition: SplashTransition.fadeTransition,
                nextScreen: EmailPassSignInScreen(),
              ),
            );
    } on FirebaseAuthException catch (e) {
      print("FIREBASE AUTH EXCEPTION - ${e.code}");
    } catch (_) {}
  }

  Future<void> logout() async => await _auth.signOut();
}
