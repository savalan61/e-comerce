import 'package:get/get.dart';
import 'package:t_store/features/shop/controllers/product%20controller/product_image_controller.dart';

import '../../models/ProductVariation_model.dart';
import '../../models/product_model.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();

  /// Variables
  RxString variationStockStatus = ''.obs;
  Rx<ProductVariationModel> selectedVariation = ProductVariationModel.empty().obs;
  RxMap<String, dynamic> selectedAttributes = <String, dynamic>{}.obs;

  /// Select Attribute, and Variation
  void onAttributeSelected(ProductModel product, String attributeName, dynamic attributeValue) {
    selectedAttributes[attributeName] = attributeValue;

    final matchingVariation = product.productVariations!.firstWhere(
      (variation) => isSameAttributeValues(variation.attributeValues, selectedAttributes),
      orElse: () => ProductVariationModel.empty(),
    );

    selectedVariation.value = matchingVariation;

    if (matchingVariation.image.isNotEmpty) {
      ProdImgController.instance.selectedProdImg.value = matchingVariation.image;
    }

    getProductVariationStockStatus();
  }

  /// Check if selected attributes match any variation's attributes
  bool isSameAttributeValues(Map<String, dynamic> variationAttributes, Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) return false;

    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) return false;
    }

    return true;
  }

  /// Check Attribute availability / Stock in Variation
  Set<String> getAttributesAvailabilityInVariation(List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttributeValues = variations
        .where((variation) =>
            variation.attributeValues[attributeName] != null &&
            variation.attributeValues[attributeName]!.isNotEmpty &&
            variation.stock > 0)
        .map((variation) => variation.attributeValues[attributeName]!)
        .toSet();

    return availableVariationAttributeValues;
  }

  /// Check Product Variation Stock Status
  void getProductVariationStockStatus() {
    variationStockStatus.value = selectedVariation.value.stock > 0 ? 'In Stock' : 'Out of Stock';
  }

  /// Reset Selected Attributes when switching products
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    variationStockStatus.value = '';
    selectedVariation.value = ProductVariationModel.empty();
  }

  String getVariationPrice() {
    return (selectedVariation.value.salePrice > 0 ? selectedVariation.value.salePrice : selectedVariation.value.price)
        .toString();
  }
}
