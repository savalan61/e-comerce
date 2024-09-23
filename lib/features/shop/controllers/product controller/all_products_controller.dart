import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();

  final ProductRepository repository = ProductRepository.instance;
  final RxString selectedSortOption = "Name".obs;
  final RxList<ProductModel> products = <ProductModel>[].obs;

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      if (query == null) return [];

      final products = await repository.fetchProductsByQuery(query);

      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;

    switch (sortOption) {
      case 'Name':
        products.sort((a, b) => a.title.compareTo(b.title));
        break;

      case 'Higher Price':
        products.sort((a, b) => b.price.compareTo(a.price));
        break;

      case 'Lower Price':
        products.sort((a, b) => a.price.compareTo(b.price));
        break;

      case 'Newest':
        products.sort((a, b) {
          if (a.date != null && b.date != null) {
            return b.date!.compareTo(a.date!);
          }
          return 0;
        });
        break;

      case 'Sale':
        products.sort((a, b) {
          if (b.salePrice > 0 && a.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else if (b.salePrice > 0) {
            return -1;
          } else if (a.salePrice > 0) {
            return 1;
          }
          return 0;
        });
        break;

      default:
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
    }
  }

  void assignProducts(List<ProductModel> prods) {
    products.assignAll(prods);
    sortProducts("Name");
  }
}
