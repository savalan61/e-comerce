import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart' show PlatformException, rootBundle;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TFirebaseStorageService extends GetxController {
  final _firebaseStorage = FirebaseStorage.instance;

  /// upload local assets from ide
  /// return a unit8list containing image data
  Future<Uint8List> getImageDataFromAssets(String assetPath) async {
    try {
      final ByteData byteData = await rootBundle.load(assetPath);
      final Uint8List imageData = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      throw "Error loading  image data $e";
    }
  }

  /// Upload image using image data on cloud firebase storage
  /// Return the download url
  Future<String> uploadImageData(String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw "Firebase Exception: ${e.message}";
      } else if (e is SocketException) {
        throw "Network Error: ${e.message}";
      } else if (e is PlatformException) {
        throw "Platform Exception: ${e.message}";
      } else {
        throw 'Error fetching categories: $e';
      }
    }
  }

  /// Upload image using image data on cloud firebase storage
  /// Return the download url
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw "Firebase Exception: ${e.message}";
      } else if (e is SocketException) {
        throw "Network Error: ${e.message}";
      } else if (e is PlatformException) {
        throw "Platform Exception: ${e.message}";
      } else {
        throw 'Error fetching categories: $e';
      }
    }
  }
}
