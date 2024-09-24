import 'dart:convert';

import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/local_storage/storage_utility.dart';

class FavoriteController extends GetxController {
  static FavoriteController get instance => Get.find();

  final RxMap<String, bool> favorites = <String, bool>{}.obs;

  /// {1:true, 2:true, 3:false}

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  Future<void> initFavorites() async {
    final json = TLocalStorage.instance().readData("favorites");
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavorite(String prodId) {
    return favorites[prodId] ?? false;
  }

  void toggleProduct(String id) {
    if (!favorites.containsKey(id)) {
      favorites[id] = true;
      saveFavoriteToStorage();
      TLoaders.customToast(message: "Product Added To List.");
    } else {
      TLocalStorage.instance().removeData(id);
      favorites.remove(id);
      saveFavoriteToStorage();
      TLoaders.customToast(message: "Product Removed From List.");

      favorites.refresh();
    }
  }

  void saveFavoriteToStorage() {
    var json = jsonEncode(favorites);
    TLocalStorage.instance().writeData("favorites", json);
  }

  Future<List<ProductModel>> fetchFavoriteProduct() async {
    return await ProductRepository.instance.fetchFavoriteProducts(favorites.keys.toList());
  }
}
