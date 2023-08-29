import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class QueryController extends GetxController {
  static QueryController get instance => Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController responseController = TextEditingController();

  void sendEmail() async {
    final SmtpServer = gmail('jsskossmtp@gmail.com', "email@jsskos");

    final message = Message()
      ..from = Address('jsskossmtp@gmail.com', "jsskos smtp")
      ..recipients.add("prithviraj2062002@gmail.com")
      ..subject = titleController.text
      ..text = responseController.text;

    try {
      final sendReport = await send(message, SmtpServer);
      print('Message sent: ${sendReport.toString()}');
      showSuccessSnackBar();
    } catch (e) {
      print('error sending email: $e');
      showErrorSnackbar();
    }
  }

  void showSuccessSnackBar() {
    Get.snackbar("Success", "Email sent successfull",
        backgroundColor: Colors.white, colorText: Colors.green);
  }

  void showErrorSnackbar() {
    Get.snackbar(
      'Error',
      'Failed to send email',
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
