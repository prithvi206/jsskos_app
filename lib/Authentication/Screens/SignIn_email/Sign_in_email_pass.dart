import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jsskos_app/Authentication/Screens/SignIn_email/forgot_password/forgot_password_email.dart';
import 'package:jsskos_app/Authentication/Screens/SignIn_email/forgot_password/forgot_password_phone.dart';
import 'package:jsskos_app/Authentication/Screens/signup/signUp.dart';
import 'package:jsskos_app/Authentication/controllers/signin_controller.dart';

class EmailPassSignInScreen extends StatefulWidget {
  @override
  _EmailPassSignInScreenState createState() => _EmailPassSignInScreenState();
}

class _EmailPassSignInScreenState extends State<EmailPassSignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 9.0, top: 7.0),
                  height: 250,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 214, 84, 67),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                          height: 100,
                          margin: const EdgeInsets.all(10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              "assets/images/logo2.png",
                              scale: 0.9,
                            ),
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'WELCOME TO JSSKOS APP',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 44.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: controller.email,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: "Email",
                            hintText: "Enter your E-mail",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: controller.password,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.fingerprint),
                            suffixIcon: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.remove_red_eye_sharp)),
                            labelText: "Password",
                            hintText: "Enter your Password",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    context: context,
                                    builder: (context) => Container(
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(20),
                                                  topRight:
                                                      Radius.circular(20)),
                                              color: Colors.white),
                                          width: double.infinity,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 40.0, vertical: 30),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                "Reset Password",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              const Text(
                                                "Select one of the method to verify and reset password.",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ForgotPasswordEmailScreen()));
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: const Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .mail_outline_rounded,
                                                        size: 60.0,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Email",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          Text(
                                                            "Reset via Mail Verification.",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ForgotPasswordPhoneScreen()));
                                                },
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: const Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .mobile_friendly_rounded,
                                                        size: 60.0,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Phone No",
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                          Text(
                                                            "Reset via Phone Verification.",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300),
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ));
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 21, 120, 200)),
                              )),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: 300,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                SignInController.instance.SignInUser(
                                    controller.email.text.trim(),
                                    controller.password.text.trim());
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text(
                              "Sign In",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen()));
                          },
                          child: const Text.rich(TextSpan(
                              text: "Don't have an Account? ",
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: " Sign Up",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 21, 120, 200)),
                                )
                              ])),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
