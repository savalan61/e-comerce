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
    fetchFeaturedProducts();
  }

  /// Get All Products
  Future<void> fetchFeaturedProducts() async {
    try {
      isLoading(true);
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading(false);
        TLoaders.errorSnackBar(title: "Internet Problem", message: "Check your internet connections");
        return;
      }
      final cats = await _repo.getFeaturedProducts();
      allProducts.assignAll(cats);
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final prods = await _repo.getAllFeaturedProducts();
      return prods;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }

  /// Get the product price or price range for variation
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    if (product.productType == ProductType.single) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    } else {
      for (var variation in product.productVariations!) {
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }
        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        return '$smallestPrice-\$$largestPrice';
      }
    }
  }

  /// Calculate discount percentage
  String? calculateSalePrice(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;
    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// Check product stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? "In Stock" : "Out of Stock";
  }
}
