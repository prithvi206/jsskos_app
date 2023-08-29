import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:async/async.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jsskos_app/Authentication/Screens/SignIn_email/Sign_in_email_pass.dart';
import 'package:jsskos_app/Authentication/Screens/SignIn_email/forgot_password/forgot_password_phone.dart';
import 'package:jsskos_app/Authentication/Screens/SignIn_email/forgot_password/forgot_password_phone_otp.dart';
import 'package:jsskos_app/Authentication/Screens/SignIn_phone/Sign_in_phone.dart';
import 'package:jsskos_app/Authentication/Screens/SignIn_phone/otp_phone.dart';
import 'package:jsskos_app/Authentication/repository/authentication_repository.dart';
import 'package:jsskos_app/Nav_bars/bottom_nav.dart';
import 'package:jsskos_app/Notfiications/notification_controller.dart';
import 'package:jsskos_app/screen/home.dart';
import 'firebase_options.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:jsskos_app/registration/registration_form.dart';
import "package:get/get.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  await NotificationController().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "JSS KOS",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 255, 255)),
        // useMaterial3: true,
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('assets/images/splash_image.png'),
        duration: 2500,
        splashTransition: SplashTransition.fadeTransition,
        nextScreen: EmailPassSignInScreen(),
      ),
    );
  }
}
