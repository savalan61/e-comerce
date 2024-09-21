import 'package:get/get.dart';
import 'package:t_store/common/widgets/loaders/loaders.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';
import 'package:t_store/utils/helpers/network_manager.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final _repo = Get.put(ProductRepository());
  final RxBool isLoading = false.obs;
  final RxList<ProductModel> allProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  /// Get All Categories
  Future<void> fetchProducts() async {
    try {
      isLoading(true);
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading(false);
        TLoaders.errorSnackBar(title: "Internet Problem", message: "Check your internet connections");
        return;
      }
      final cats = await _repo.getAllProducts();
      allProducts.assignAll(cats);
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading(false);
    }
  }
}
