import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../categories/firebase_storage_service.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where("IsFeatured", isEqualTo: true).limit(4).get();
      final products = snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Error fetching categories: $e';
    }
  }

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db.collection('Products').where("IsFeatured", isEqualTo: true).get();
      final products = snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Error fetching categories: $e';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> products = querySnapshot.docs.map((doc) => ProductModel.fromQuerySnapshot(doc)).toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Error fetching categories: $e';
    }
  }

  Future<List<ProductModel>> fetchFavoriteProducts(List<String> prodIds) async {
    try {
      final snapShot = await _db.collection("Products").where(FieldPath.documentId, whereIn: prodIds).get();
      final List<ProductModel> products = snapShot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Error fetching categories: $e';
    }
  }

  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {
    try {
      var query = limit == -1
          ? _db.collection('Products').where("Brand.id", isEqualTo: brandId)
          : _db.collection('Products').where("Brand.id", isEqualTo: brandId).limit(limit);

      final snapshot = await query.get();
      final products = snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Error fetching products: $e';
    }
  }

  Future<List<ProductModel>> getProductsForCategory({
    required String categoryId,
    int limit = 4,
  }) async {
    try {
      // Query to get all documents where productId matches the provided categoryId
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).get()
          : await _db.collection('ProductCategory').where('categoryId', isEqualTo: categoryId).limit(limit).get();

      // Extract productIds from the documents
      List<String> productIds = productCategoryQuery.docs.map((doc) => doc['productId'] as String).toList();

      // Query to get all products where the productId is in the list of productIds
      final productsQuery = await _db.collection('Products').where(FieldPath.documentId, whereIn: productIds).get();

      // Extract product data and map to ProductModel
      List<ProductModel> products = productsQuery.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();

      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}

Future<void> uploadDummyData(List<ProductModel> products) async {
  final db = FirebaseFirestore.instance;

  try {
    final storage = Get.put(TFirebaseStorageService());

    for (var product in products) {
      final thumbnail = await storage.getImageDataFromAssets(product.thumbnail);
      final thumbnailUrl = await storage.uploadImageData('products', thumbnail, product.thumbnail.split('/').last);
      product.thumbnail = thumbnailUrl;

      if (product.images != null && product.images!.isNotEmpty) {
        List<String> imagesUrl = [];
        for (var image in product.images!) {
          final assetImage = await storage.getImageDataFromAssets(image);
          final url = await storage.uploadImageData('products', assetImage, image.split('/').last);
          imagesUrl.add(url);
        }
        product.images!.clear();
        product.images!.addAll(imagesUrl);
      }

      if (product.brand != null) {
        final brandImage = await storage.getImageDataFromAssets(product.brand!.image);
        final brandImageUrl = await storage.uploadImageData('Brands', brandImage, product.brand!.name);
        product.brand!.image = brandImageUrl;
      }

      if (product.productType == ProductType.variable && product.productVariations != null) {
        for (var variation in product.productVariations!) {
          final variationImage = await storage.getImageDataFromAssets(variation.image);
          final variationImageUrl =
              await storage.uploadImageData('products', variationImage, variation.image.split('/').last);
          variation.image = variationImageUrl;
        }
      }

      await db.collection("Products").doc(product.id).set(product.toJson());
    }
  } on FirebaseException catch (e) {
    throw "Firebase Exception: ${e.message}";
  } on SocketException catch (e) {
    throw "Network Error: ${e.message}";
  } on PlatformException catch (e) {
    throw "Platform Exception: ${e.message}";
  } catch (e) {
    throw "Error: ${e.toString()}";
  }
}
