import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel({
    required this.id,
    required this.name,
    required this.image,
    this.parentId = "",
    required this.isFeatured,
  });

  static CategoryModel empty() => CategoryModel(id: "", name: "", image: "", parentId: "", isFeatured: false);

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'ParentId': parentId,
      'IsFeatured': isFeatured,
    };
  }

  factory CategoryModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final map = document.data()!;
      return CategoryModel(
        id: document.id,
        name: map['Name'] ?? '',
        image: map['Image'] ?? '',
        parentId: map['ParentId'] ?? '',
        isFeatured: map['IsFeatured'] ?? false,
      );
    } else {
      return empty();
    }
  }
}
