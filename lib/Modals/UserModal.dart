import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  static List<UserModal> Users = [];
}

class UserModal {
  final String address;
  final String contact;
  final String name;
  final String uid;
  final String email;

  UserModal(
      {required this.address,
      required this.contact,
      required this.name,
      required this.uid,
      required this.email});

  factory UserModal.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModal(
        address: snapshot.get("address"),
        contact: snapshot.get("contact") ?? "00000000",
        name: snapshot.get("name") ?? "name",
        uid: snapshot.get("uid") ?? "uid",
        email: snapshot.get("email") ?? "");
  }
}
