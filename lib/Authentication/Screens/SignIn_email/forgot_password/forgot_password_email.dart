import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jsskos_app/Authentication/Screens/SignIn_email/forgot_password/forgot_password_email_otp.dart';

class ForgotPasswordEmailScreen extends StatefulWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  State<ForgotPasswordEmailScreen> createState() =>
      _ForgotPasswordEmailScreenState();
}

class _ForgotPasswordEmailScreenState extends State<ForgotPasswordEmailScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();

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
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Text(
                            'Email Verification',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 44.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Text(
                              "Enter your Email Id to verify and reset password."),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: emailController,
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
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: 300,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // Form is valid, proceed with registration

                                  try {
                                    await FirebaseAuth.instance
                                        .sendPasswordResetEmail(
                                            email: emailController.text.trim());
                                    // ignore: use_build_context_synchronously
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return const AlertDialog(
                                            content: Text(
                                                'Password reset link sent! Check your email.'),
                                          );
                                        });
                                  } on FirebaseAuthException catch (e) {
                                    print(e);
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0)),
                                            content: Text(e.message.toString()),
                                          );
                                        });
                                  }
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                "Reset Password",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
