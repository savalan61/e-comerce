import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/category_mode.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/helpers/network_manager.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _catRepo = Get.put(CategoryRepository());
  final RxBool isLoadingCats = false.obs;
  final RxBool isLoadingSubs = false.obs;
  final RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  final RxList<CategoryModel> subCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  /// Get All Categories
  Future<void> fetchCategories() async {
    try {
      isLoadingCats(true);
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoadingCats(false);
        TLoaders.errorSnackBar(title: "Internet Problem", message: "Check your internet connections");
        return;
      }
      final cats = await _catRepo.getAllCategories();
      allCategories.assignAll(cats);
      featuredCategories
          .assignAll(cats.where((element) => element.isFeatured && element.parentId.isEmpty).take(8).toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoadingCats(false);
    }
  }

  /// Get Sub Categories By parent Id
  Future<void> getSubCategories(String parentId) async {
    try {
      isLoadingSubs(true);

      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoadingSubs(false);
        TLoaders.errorSnackBar(title: "Connection problem", message: "Check your internet connections");
        return;
      }

      final cats = await _catRepo.getAllCategories();

      final List<CategoryModel> subCats =
          cats.where((element) => !element.isFeatured && element.parentId == parentId).toList();

      subCategories.assignAll(subCats);
    } catch (e) {
      TLoaders.errorSnackBar(
        title: "Oh Snap!",
        message: e.toString(),
      );
    } finally {
      isLoadingSubs(false);
    }
  }

  Future<List<ProductModel>> getCategoryProduct({required String cateId, int limit = -1}) async {
    final products = await ProductRepository.instance.getProductsForCategory(categoryId: cateId, limit: limit);
    return products;
  }
}
