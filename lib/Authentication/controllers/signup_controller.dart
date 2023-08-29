import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsskos_app/Authentication/repository/authentication_repository.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNo = TextEditingController();

  void registerUser(
      String fullName, String phoneNo, String email, String password) {
    AuthenticationRepository.instance
        .createUserWithEmailAndPassword(fullName, phoneNo, email, password);
  }
}
