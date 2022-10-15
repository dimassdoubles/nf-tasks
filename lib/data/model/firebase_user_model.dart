import '../../domain/entity/firebase_user.dart';

class FirebaseUserModel extends FirebaseUser {
  FirebaseUserModel(
      {required super.uid, required super.name, required super.email});

  factory FirebaseUserModel.fromJson(Map<String, dynamic> json) {
    return FirebaseUserModel(
      uid: json["uid"],
      name: json["name"],
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "name": name,
      "email": email,
    };
  }
}
