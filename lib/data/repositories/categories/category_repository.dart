import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/categories/firebase_storage_service.dart';
import 'package:t_store/features/shop/models/category_mode.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final categories = snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
      return categories;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Error fetching categories: $e';
    }
  }

// /// Get all Sub Categories
// Future<void> getSubCategories(String parentId) async {
//   try {
//     final snapshot = await _db.collection('Categories').get();
//     final categories = snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
//
//     featuredCategories
//         .assignAll(cats.where((element) => element.isFeatured && element.parentId.isEmpty).take(8).toList());
//   } catch (e) {
//     TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
//   } finally {
//     isLoading(false);
//   }
// }

  /// Upload Categories to firebase
  ///  Upload the categories to Firebase storage
}

Future<void> uploadDummyCatData(List<CategoryModel> categories) async {
  final db = FirebaseFirestore.instance;

  try {
    final storage = Get.put(TFirebaseStorageService());
    for (var cat in categories) {
      final file = await storage.getImageDataFromAssets(cat.image);
      final url = await storage.uploadImageData("Categories", file, cat.name);
      cat.image = url;
      await db.collection("Categories").doc(cat.id).set(cat.toJson());
    }
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message;
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Error fetching categories: $e';
  }
}
