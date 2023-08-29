import 'package:flutter/material.dart';
import 'package:jsskos_app/Authentication/Screens/SignIn_email/forgot_password/forgot_password_phone_otp.dart';

class ForgotPasswordPhoneScreen extends StatefulWidget {
  const ForgotPasswordPhoneScreen({super.key});

  @override
  State<ForgotPasswordPhoneScreen> createState() =>
      _ForgotPasswordPhoneScreenState();
}

class _ForgotPasswordPhoneScreenState extends State<ForgotPasswordPhoneScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }

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
                            'Phone Verification',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 44.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                              "Enter your phone number to verify and reset password."),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: phoneNumberController,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
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
                          const SizedBox(
                            height: 25,
                          ),
                          SizedBox(
                            width: 300,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  // Form is valid, proceed with registration

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ForgotPasswordPhoneOtpScreen(
                                                number:
                                                    "${countryController.text} ${phoneNumberController.text}",
                                              )));
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                "Send the code",
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
