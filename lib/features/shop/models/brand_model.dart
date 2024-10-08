import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../data/repositories/categories/firebase_storage_service.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.name,
    required this.image,
    this.isFeatured,
    this.productsCount,
  });

  static BrandModel empty() => BrandModel(
        id: "",
        name: "",
        image: "",
        isFeatured: false,
        productsCount: 0,
      );

  factory BrandModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final snapshot = doc.data()!;
    return BrandModel(
      id: doc.id,
      name: snapshot['name'] ?? '',
      image: snapshot['image'] ?? '',
      isFeatured: snapshot['isFeatured'] ?? false,
      productsCount: snapshot['productsCount'] ?? 0,
    );
  }

  factory BrandModel.fromJson(Map<String, dynamic> snapshot) {
    return BrandModel(
      id: snapshot['id'] ?? '',
      name: snapshot['name'] ?? '',
      image: snapshot['image'] ?? '',
      isFeatured: snapshot['isFeatured'],
      productsCount: snapshot['productsCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'isFeatured': isFeatured ?? false,
      'productsCount': productsCount ?? 0,
    };
  }
}

Future<void> uploadBrandsData(List<BrandModel> brands) async {
  final db = FirebaseFirestore.instance;

  try {
    final storage = Get.put(TFirebaseStorageService());

    for (var ban in brands) {
      final file = await storage.getImageDataFromAssets(ban.image);
      final url = await storage.uploadImageData("Brands", file, ban.name);
      ban.image = url;

      await db.collection("Brands").doc(ban.id).set(ban.toJson());
    }
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Error uploading brands: $e';
  }
}
