import "package:cloud_firestore/cloud_firestore.dart";

class UserModel {
  final String? id;
  final String fullName;
  final String email;
  final String phoneNo;

  const UserModel({
    this.id,
    required this.email,
    required this.fullName,
    required this.phoneNo,
  });

  toJson() {
    return {"Name": fullName, "email": email, "phone number": phoneNo};
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    print(data["phone number"]);
    return UserModel(
        email: data["email"],
        fullName: data["name"],
        phoneNo: data["phone Number"]);
  }
}
