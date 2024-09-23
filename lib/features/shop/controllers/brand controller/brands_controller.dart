import 'package:get/get.dart';
import 'package:t_store/data/repositories/brand/brand_repository.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/features/shop/models/product_model.dart';

import '../../../../common/widgets/loaders/loaders.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../models/brand_model.dart';

class BrandsController extends GetxController {
  static BrandsController get instance => Get.find();

  final _repo = Get.put(BrandRepository());
  final RxBool isLoading = false.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;

  @override
  void onInit() {
    fetchAllBrands();
    super.onInit();
  }

  /// Get Featured Brands

  Future<void> fetchAllBrands() async {
    try {
      isLoading(true);
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading(false);
        TLoaders.errorSnackBar(title: "Internet Problem", message: "Check your internet connections");
        return;
      }
      final brands = await _repo.getAllBrands();
      allBrands.assignAll(brands);
      featuredBrands.assignAll(brands.where((element) => element.isFeatured ?? false).take(4));
      final a = 3;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<List<ProductModel>> getBrandProducts(String brandId) async {
    final prods = await ProductRepository.instance.getBrandProducts(brandId: brandId);
    return prods;
  }
}
