// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:t_store/features/shop/models/banner_model.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  /// Get all Categories
  Future<List<BannerModel>> getAllBanners() async {
    try {
      final snapshot = await _db.collection('Banners').where("active", isEqualTo: true).get();
      final banners = snapshot.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
      return banners;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Error fetching banners: $e';
    }
  }
}
