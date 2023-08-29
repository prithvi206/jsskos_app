import 'dart:io';
import "package:get/get.dart";
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:jsskos_app/Authentication/repository/authentication_repository.dart';

class AdmissionRepository extends GetxController {
  static AdmissionRepository get instance => Get.find();
  final _authRepo = Get.put(AuthenticationRepository());

  Future<void> AddpersonalDetails(
      String Name,
      String FatherName,
      String MotherName,
      DateTime BirthDate,
      String Gender,
      String AadhaarNumber,
      String Religion,
      String Caste) async {
    Map<String, dynamic> AdmissionuserInfoMap = {
      "Name": Name,
      "Father Name": FatherName,
      "Mother Name": MotherName,
      "Date of Birth": BirthDate,
      "Gender": Gender,
      "Aadhaar Number": AadhaarNumber,
      "Religion": Religion,
      "Caste": Caste,
    };
    await FirebaseFirestore.instance
        .collection("AdmittedUsers")
        .doc(_authRepo.firebaseUser.value?.uid)
        .collection("1.Personal Details")
        .doc("1")
        .set(AdmissionuserInfoMap);
  }

  Future<void> AddContactDetails(
      String phoneNumber,
      String altPhoneNumber,
      String SState,
      String District,
      String PostalAddress,
      String PinCode) async {
    Map<String, dynamic> AdmissionuserInfoMap = {
      "phone Number": phoneNumber,
      "Alternate phone Number": altPhoneNumber,
      "State": SState,
      "District": District,
      "Postal Address": PostalAddress,
      "Pin Code": PinCode,
    };
    await FirebaseFirestore.instance
        .collection("AdmittedUsers")
        .doc(_authRepo.firebaseUser.value?.uid)
        .collection("2.Contact Details")
        .doc("1")
        .set(AdmissionuserInfoMap);
  }

  Future<void> AddEducationalBackgroundDetails(
    String Course,
    String Medium,
    String Area,
    String District,
    List<String> selectedSubjects,
    List<String> selectedLanguages,
  ) async {
    Map<String, dynamic> AdmissionuserInfoMap = {
      "Course": Course,
      "Medium of Study": Medium,
      "Study Center District": District,
      "Study Center Area": Area,
      "Selected Languages": selectedLanguages,
      "Selected Subjects": selectedSubjects,
    };
    await FirebaseFirestore.instance
        .collection("AdmittedUsers")
        .doc(_authRepo.firebaseUser.value?.uid)
        .collection("3.Education Background Details")
        .doc("1")
        .set(AdmissionuserInfoMap);
  }

  Future<void> UploadDocuments(File photo, String name) async {
    // Upload image to Firebase Storage
    Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('documents/${_authRepo.firebaseUser.value?.uid}/${photo.path}');
    UploadTask uploadTask = storageReference.putFile(photo);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    // Get download URL of uploaded image
    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    FirebaseFirestore.instance
        .collection("AdmittedUsers")
        .doc(_authRepo.firebaseUser.value?.uid)
      ..collection("4.Document Upload").doc("${name}").set({
        'imageUrl': downloadUrl,
        'timestamp': FieldValue.serverTimestamp(),
      });
  }
}
