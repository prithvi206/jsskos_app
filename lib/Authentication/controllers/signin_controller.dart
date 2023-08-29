import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsskos_app/Authentication/repository/authentication_repository.dart';

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();

  void SignInUser(String email, String password) {
    AuthenticationRepository.instance
        .siginUserWithEmailAndPassword(email, password);
  }
}
