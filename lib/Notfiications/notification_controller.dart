import "package:cloud_firestore/cloud_firestore.dart";
import "package:firebase_messaging/firebase_messaging.dart";
import "package:get/get.dart";
import 'package:flutter/material.dart';
import "package:jsskos_app/Authentication/repository/authentication_repository.dart";

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title : ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('PayLoad: ${message.data}');
}

class NotificationController {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final _authRepo = Get.put(AuthenticationRepository());
  String? mtoken = " ";

  Future<void> initNotifications() async {
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('user granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("User granted provisional permission");
    } else {
      print("User declined or has not accepted permission");
    }

    final fCMToken = await _firebaseMessaging.getToken().then((token) async {
      mtoken = token;
      print('Token: $mtoken');
    });

    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  }
}
