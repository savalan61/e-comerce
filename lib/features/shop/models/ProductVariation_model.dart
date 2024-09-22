// ignore_for_file: file_names

class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? description;
  double price;
  double salePrice;
  int stock;
  Map<String, String> attributeValues;

  ProductVariationModel({
    required this.id,
    this.sku = '',
    this.image = '',
    this.description,
    this.price = 0.0,
    this.salePrice = 0.0,
    this.stock = 0,
    required this.attributeValues,
  });

  static ProductVariationModel empty() => ProductVariationModel(id: '', attributeValues: {});

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'SKU': sku,
      'Image': image,
      'Description': description,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttributeValues': attributeValues,
    };
  }

  factory ProductVariationModel.fromJson(Map<String, dynamic> json) {
    return ProductVariationModel(
      id: json['Id'],
      sku: json['SKU'] ?? '',
      image: json['Image'] ?? '',
      description: json['Description'],
      price: (json['Price'] is num) ? (json['Price'] as num).toDouble() : 0.0,
      salePrice: (json['SalePrice'] is num) ? (json['SalePrice'] as num).toDouble() : 0.0,
      stock: json['Stock'] ?? 0,
      attributeValues: Map<String, String>.from(json['AttributeValues'] ?? {}),
    );
  }
}
