import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/brand_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final brands = snapshot.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      return brands;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Error fetching categories: $e';
    }
  }

  /// Get Brands For Category
  /// Get Brands For Category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query to get all documents where categoryId matches the provided categoryId
      QuerySnapshot brandCategoryQuery =
          await _db.collection('BrandCategories').where('categoryId', isEqualTo: categoryId).get();

      // Extract brandIds from the documents
      List<String> brandIds = brandCategoryQuery.docs.map((doc) => doc['brandId'] as String).toList();

      // Check if there are brandIds before querying Brands collection
      if (brandIds.isEmpty) {
        return []; // Return empty list if no brands found
      }

      // Query to get all documents where the brandId is in the list of brandIds
      final brandsQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2) // Consider making this limit configurable if needed
          .get();

      // Extract brand names or other relevant data from the documents
      List<BrandModel> brands = brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();

      return brands;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Brands.';
    }
  }
}
