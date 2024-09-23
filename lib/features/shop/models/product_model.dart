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
  ProductType productType;
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
      'ProductType': productType.toString().split('.').last,
      'ProductAttributes': productAttributes?.map((attr) => attr.toJson()).toList(),
      'ProductVariations': productVariations?.map((variation) => variation.toJson()).toList(),
    };
  }

  factory ProductModel.empty() => ProductModel(
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

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    final json = doc.data()!;
    return ProductModel(
      id: doc.id,
      title: json['Title'],
      stock: json['Stock'] ?? 0,
      price: json['Price'],
      thumbnail: json['Thumbnail'],
      productType: json['ProductType'] == 'variable' ? ProductType.variable : ProductType.single,
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

  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;

    return ProductModel(
      id: document.id,
      sku: data['SKU'] ?? '',
      title: data['Title'] ?? '',
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.8).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: data['Brand'] != null ? BrandModel.fromJson(data['Brand']) : null,
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: data['ProductAttributes'] != null
          ? (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList()
          : [],
      productVariations: data['ProductVariations'] != null
          ? (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList()
          : [],
    );
  }
}
