import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageURL;
  String targetScreen;
  bool active;
  String? imageUrl;

  BannerModel({
    required this.imageURL,
    required this.targetScreen,
    required this.active,
    this.imageUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'imageURL': imageURL,
      'targetScreen': targetScreen,
      'active': active,
      'imageUrl': imageUrl,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return BannerModel(
      imageURL: data['imageURL'],
      targetScreen: data['targetScreen'],
      active: data['active'],
      imageUrl: data['imageUrl'],
    );
  }
}
