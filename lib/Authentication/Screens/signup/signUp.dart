import 'package:flutter/material.dart';
import 'package:jsskos_app/Authentication/Screens/SignIn_email/Sign_in_email_pass.dart';
import 'package:jsskos_app/Authentication/controllers/signup_controller.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _confirmpassword = TextEditingController();

  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
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
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 35.0,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        TextFormField(
                          controller: controller.fullName,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person_outline_outlined),
                            labelText: 'Name',
                            hintText: 'Enter your full name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: controller.email,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email_outlined),
                            labelText: "Email",
                            hintText: "Enter your E-mail",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a valid Email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: controller.phoneNo,
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: 'Phone Number',
                            hintText: 'Enter your 10 digit phone number',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 10) {
                              return 'Please enter valid phone number';
                            }
                            // Additional phone number validation can be added here
                            return null;
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: controller.password,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.fingerprint),
                            // suffixIcon: IconButton(
                            //     onPressed: null,
                            //     icon: Icon(Icons.remove_red_eye_sharp)),
                            labelText: "Password",
                            hintText: "Enter your Password",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 6) {
                              return 'Password length Cannot be less than 6';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _confirmpassword,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.fingerprint),
                            // suffixIcon: IconButton(
                            //     onPressed: null,
                            //     icon: Icon(Icons.remove_red_eye_sharp)),
                            labelText: "Confirm Password",
                            hintText: "Retype your Password",
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 6 ||
                                _confirmpassword.text !=
                                    controller.password.text) {
                              return 'Passwords dont match!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 300,
                          height: 45,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                SignUpController.instance.registerUser(
                                    controller.fullName.text.trim(),
                                    controller.phoneNo.text.trim(),
                                    controller.email.text.trim(),
                                    controller.password.text.trim());
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text(
                              "Sign Up",
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
                                    builder: (context) =>
                                        EmailPassSignInScreen()));
                          },
                          child: const Text.rich(TextSpan(
                              text: "Already have an Account? ",
                              style: TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: " Sign In",
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
