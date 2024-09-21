class BrandCategoryModel {
  String brandId;
  String categoryId;

  BrandCategoryModel({required this.brandId, required this.categoryId});

  // Convert a BrandCategoryModel into a Map (JSON)
  Map<String, dynamic> toJson() {
    return {
      'brandId': brandId,
      'categoryId': categoryId,
    };
  }

  // Convert a Map (JSON) into a BrandCategoryModel
  factory BrandCategoryModel.fromJson(Map<String, dynamic> json) {
    return BrandCategoryModel(
      brandId: json['brandId'],
      categoryId: json['categoryId'],
    );
  }
}
