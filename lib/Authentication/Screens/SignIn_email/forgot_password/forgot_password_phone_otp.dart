import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jsskos_app/screen/home.dart';
import 'package:pinput/pinput.dart';

class ForgotPasswordPhoneOtpScreen extends StatefulWidget {
  final String number;
  const ForgotPasswordPhoneOtpScreen({Key? key, required this.number})
      : super(key: key);

  @override
  State<ForgotPasswordPhoneOtpScreen> createState() =>
      _ForgotPasswordPhoneOtpScreenState();
}

class _ForgotPasswordPhoneOtpScreenState
    extends State<ForgotPasswordPhoneOtpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(15, 32, 46, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 15, 16, 16)),
        borderRadius: BorderRadius.circular(20),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
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
                  height: 200,
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
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  margin: const EdgeInsets.only(left: 25, right: 25),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Text(
                            'Phone Verification',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(25, 5, 5, 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Enter the code sent to ",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    Text(
                                      widget.number + " and",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "proceed to reset password.",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Pinput(
                            length: 6,
                            defaultPinTheme: defaultPinTheme,
                            focusedPinTheme: focusedPinTheme,
                            submittedPinTheme: submittedPinTheme,
                            showCursor: true,
                            onCompleted: (pin) => print(pin),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: 300,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                "Verify Phone Number",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(12, 5, 5, 5),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text(
                                    'Edit Phone Number?',
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
