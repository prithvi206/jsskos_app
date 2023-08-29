import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jsskos_app/Authentication/Screens/SignIn_phone/otp_phone.dart';
import 'package:jsskos_app/screen/home.dart';
import 'package:jsskos_app/Authentication/Screens/signup/signUp.dart';

// enum MobileVerficationState {
//   SHOW_MOBILE_STATE_STATE,
//   SHOW_OTP_FORM_STATE,
// }

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   MobileVerficationState currentState =
//       MobileVerficationState.SHOW_MOBILE_STATE_STATE;

//   final phoneController = TextEditingController();
//   final otpController = TextEditingController();

//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   late String verificationId;

//   bool showLoading = false;

//   void signInWithPhoneAuthCredential(
//       PhoneAuthCredential phoneAuthCredential) async {
//     try {
//       final AuthCredential =
//           await _auth.signInWithCredential(phoneAuthCredential);
//       setState(() {
//         showLoading = false;
//       });

//       if (AuthCredential?.user != null) {
//         Navigator.push(context,
//             MaterialPageRoute(builder: (context) => const HomeScreen()));
//       }
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         showLoading = false;
//       });
//       final snackBar = SnackBar(
//         content: Text(e.message.toString()),
//         backgroundColor: (Colors.black12),
//         action: SnackBarAction(
//           label: 'dismiss',
//           onPressed: () {},
//         ),
//       );
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//   }

//   getMobileFormWidget(context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             margin: null,
//             padding: const EdgeInsets.only(left: 9.0, top: 7.0),
//             height: 250,
//             width: double.infinity,
//             decoration: const BoxDecoration(
//               color: Color.fromARGB(255, 214, 84, 67),
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30)),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 50,
//                 ),
//                 Container(
//                     height: 100,
//                     margin: const EdgeInsets.all(10.0),
//                     child: Image.asset(
//                       "assets/images/logo2.png",
//                       scale: 0.9,
//                     )),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   'WELCOME TO JSSKOU APP',
//                   style: TextStyle(
//                       fontSize: 25,
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(
//             height: 50,
//           ),
//           const Text(
//             'LOGIN',
//             style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 44.0,
//                 fontWeight: FontWeight.bold),
//           ),
//           const SizedBox(
//             height: 50,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             child: TextFormField(
//               controller: phoneController,
//               keyboardType: TextInputType.phone,
//               decoration: const InputDecoration(
//                 labelText: 'Phone Number',
//                 hintText: 'Enter your 10 digit phone number',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             width: double.infinity,
//             height: 50,
//             margin: EdgeInsets.symmetric(horizontal: 40),
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: TextButton(
//               onPressed: () async {
//                 setState(() {
//                   showLoading = true;
//                 });

//                 await _auth.verifyPhoneNumber(
//                   phoneNumber: phoneController.text,
//                   verificationCompleted: (PhoneAuthCredential) async {
//                     setState(() {
//                       showLoading = false;
//                     });
//                     // signInWithPhoneAuthCredential(phoneAuthCredential);
//                   },
//                   verificationFailed: (verificationFailed) async {
//                     //recheck if error
//                     setState(() {
//                       showLoading = false;
//                     });
//                     final snackBar = SnackBar(
//                       content: Text(verificationFailed.message.toString()),
//                       backgroundColor: (Colors.black12),
//                       action: SnackBarAction(
//                         label: 'dismiss',
//                         onPressed: () {},
//                       ),
//                     );
//                     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                   },
//                   codeSent: (verificationId, forceResendingToken) {
//                     setState(() {
//                       showLoading = false;
//                       currentState = MobileVerficationState.SHOW_OTP_FORM_STATE;
//                       this.verificationId = verificationId;
//                     });
//                   },
//                   codeAutoRetrievalTimeout: ((verificationId) {}),
//                 );
//               },
//               style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.black)),
//               child: const Text(
//                 "SEND OTP",
//                 style: TextStyle(color: Colors.white, fontSize: 25),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 50.0,
//           ),
//           const Center(
//               child: Text(
//             'Or',
//             style: TextStyle(fontSize: 25.0),
//           )),
//           const SizedBox(
//             height: 40.0,
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (context) => SignUpScreen()));
//             },
//             child: const Text(
//               'Sign Up',
//               style: TextStyle(
//                   fontSize: 35,
//                   color: Color.fromARGB(255, 19, 100, 165),
//                   decoration: TextDecoration.underline),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   getOtpFormWidget(context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
// Container(
//   padding: const EdgeInsets.only(left: 9.0, top: 7.0),
//   height: 250,
//   width: double.infinity,
//   decoration: const BoxDecoration(
//     color: Color.fromARGB(255, 214, 84, 67),
//     borderRadius: BorderRadius.only(
//         bottomLeft: Radius.circular(30),
//         bottomRight: Radius.circular(30)),
//   ),
//   child: Column(
//     crossAxisAlignment: CrossAxisAlignment.center,
//     mainAxisAlignment: MainAxisAlignment.start,
//     children: [
//       const SizedBox(
//         height: 50,
//       ),
//       Container(
//           height: 100,
//           margin: const EdgeInsets.all(10.0),
//           child: Image.asset(
//             "assets/images/logo2.png",
//             scale: 0.9,
//           )),
//       const SizedBox(
//         height: 10,
//       ),
//       const Text(
//         'WELCOME TO JSSKOU APP',
//         style: TextStyle(
//             fontSize: 25,
//             color: Colors.white,
//             fontWeight: FontWeight.w500),
//       ),
//     ],
//   ),
// ),
//           const SizedBox(
//             height: 55.0,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25.0),
//             child: Container(
//               decoration: BoxDecoration(
//                   color: Colors.grey[300],
//                   borderRadius: BorderRadius.circular(12)),
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 25.0, top: 7.0),
//                 child: TextField(
//                   controller: otpController,
//                   decoration: const InputDecoration(
//                     border: InputBorder.none,
//                     hintText: "Enter the OTP",
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           Container(
//             height: 50,
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
//             width: double.infinity,
//             child: TextButton(
//               onPressed: () async {
//                 PhoneAuthCredential phoneAuthCredential =
//                     PhoneAuthProvider.credential(
//                         verificationId: verificationId,
//                         smsCode: otpController.text);

//                 signInWithPhoneAuthCredential(phoneAuthCredential);
//               },
//               style: ButtonStyle(
//                   backgroundColor: MaterialStateProperty.all(Colors.blue)),
//               child: const Text(
//                 "Verify",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 50.0,
//           ),
//           const Center(
//               child: Text(
//             'Or',
//             style: TextStyle(fontSize: 25.0),
// )),
// const SizedBox(
//   height: 60.0,
// ),
// TextButton(
//   onPressed: () {
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => SignUpScreen()));
//   },
//   child: Text(
//     'Sign Up',
//     style: TextStyle(
//         fontSize: 35,
//         color: Color.fromARGB(255, 19, 100, 165),
//         decoration: TextDecoration.underline),
//   ),
// ),
//         ],
//       ),
//     );
//   }

//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       body: Container(
//         child: showLoading
//             ? const Center(
//                 child: CircularProgressIndicator(),
//               )
//             : currentState == MobileVerficationState.SHOW_MOBILE_STATE_STATE
//                 ? getMobileFormWidget(context)
//                 : getOtpFormWidget(context),
//       ),
//     );
//   }
// }

class PhoneSignInScreen extends StatefulWidget {
  const PhoneSignInScreen({super.key});

  @override
  State<PhoneSignInScreen> createState() => _PhoneSignInScreenState();
}

class _PhoneSignInScreenState extends State<PhoneSignInScreen> {
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
                        'Sign In',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 44.0,
                            fontWeight: FontWeight.bold),
                      ),
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
                                      builder: (context) => PhoneOtpScreen(
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
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Not registered Yet?",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpScreen()));
                            },
                            child: const Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 19, 100, 165),
                                  decoration: TextDecoration.underline),
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
