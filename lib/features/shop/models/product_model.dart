import 'package:cloud_firestore/cloud_firestore.dart';

import 'ProductAttribute_model.dart';
import 'ProductVariation_model.dart';
import 'brand_model.dart';

enum ProductType {
  single,
  variable,
}

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  ProductType productType; // تغییر نوع به ProductType
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.description,
    this.isFeatured,
    this.salePrice = 0.0,
    this.categoryId,
    this.productAttributes,
    this.productVariations,
  });

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Stock': stock,
      'SKU': sku,
      'Price': price,
      'Title': title,
      'Date': date?.toIso8601String(),
      'SalePrice': salePrice,
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured,
      'Brand': brand?.toJson(),
      'Description': description,
      'CategoryId': categoryId,
      'Images': images,
      'ProductType': productType.toString().split('.').last, // به عنوان رشته
      'ProductAttributes': productAttributes?.map((attr) => attr.toJson()).toList(),
      'ProductVariations': productVariations?.map((variation) => variation.toJson()).toList(),
    };
  }

  factory ProductModel.empty() {
    return ProductModel(
      id: '',
      title: '',
      stock: 0,
      price: 0.0,
      thumbnail: '',
      productType: ProductType.single,
      images: [],
      productAttributes: [],
      productVariations: [],
    );
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final json = doc.data()!;
    return ProductModel(
      id: doc.id,
      title: json['Title'],
      stock: json['Stock'] ?? 0,
      price: json['Price'],
      thumbnail: json['Thumbnail'],
      productType: json['ProductType'] == 'variable' ? ProductType.variable : ProductType.single,
      // تبدیل به ProductType
      sku: json['SKU'],
      brand: json['Brand'] != null ? BrandModel.fromJson(json['Brand']) : null,
      date: json['Date'] != null ? DateTime.parse(json['Date']) : null,
      salePrice: json['SalePrice'] ?? 0.0,
      isFeatured: json['IsFeatured'],
      description: json['Description'],
      categoryId: json['CategoryId'],
      images: json['Images'] != null ? List<String>.from(json['Images']) : [],
      productAttributes: json['ProductAttributes'] != null
          ? List<ProductAttributeModel>.from(
              json['ProductAttributes'].map((attr) => ProductAttributeModel.fromJson(attr)),
            )
          : null,
      productVariations: json['ProductVariations'] != null
          ? List<ProductVariationModel>.from(
              json['ProductVariations'].map((variation) => ProductVariationModel.fromJson(variation)),
            )
          : null,
    );
  }
}
