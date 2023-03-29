import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  static List<PostModal> posts = [];
}

class PostModal {
  final String address;
  final String application_type;
  final String blood_type;
  final String contact;
  final String details;
  final String name;
  final String id;
  final bool isCompleted;
  final double longitude;
  final double latitude;
  final String user_id;
  final Timestamp time_posted;

  PostModal(
      {required this.address,
      required this.application_type,
      required this.blood_type,
      required this.contact,
      required this.details,
      required this.name,
      required this.id,
      required this.isCompleted,
      required this.longitude,
      required this.latitude,
      required this.user_id,
      required this.time_posted});

  static PostModal fromSnapshot(DocumentSnapshot snapshot) {
    return PostModal(
        address: snapshot["hospital"],
        application_type: snapshot["application_type"],
        blood_type: snapshot["blood_type"],
        contact: snapshot["contact"],
        details: snapshot["note"],
        name: snapshot["name"],
        id: snapshot["id"],
        isCompleted: snapshot["completed"],
        longitude: snapshot["longitude"],
        latitude: snapshot["latitude"],
        user_id: snapshot["user_id"],
        time_posted: snapshot["time_posted"]);
  }
}
