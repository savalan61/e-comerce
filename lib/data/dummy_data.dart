import 'package:t_store/features/shop/models/brand_model.dart';

import '../features/shop/models/ProductAttribute_model.dart';
import '../features/shop/models/ProductVariation_model.dart';
import '../features/shop/models/brand_category_model.dart';
import '../features/shop/models/category_mode.dart';
import '../features/shop/models/product_category_models.dart';
import '../features/shop/models/product_model.dart';
import '../utils/constants/image_strings.dart';

class TDummyData {
  /// List of all Products
  static final List<ProductModel> products = [
    ProductModel(
      id: '31',
      title: 'running Adidas',
      stock: 50,
      price: 120,
      isFeatured: true,
      thumbnail: TImages.productImage30,
      description: 'Comfortable Adidas running shoes for everyday use.',
      brand: BrandModel(
        id: '2',
        image: TImages.adidasLogo,
        name: 'Adidas',
        productsCount: 300,
        isFeatured: true,
      ),
      salePrice: 90,
      sku: 'AD4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Blue', 'Black']),
        ProductAttributeModel(name: 'Size', values: ['EU 40', 'EU 41']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 20,
          price: 120,
          salePrice: 110,
          image: TImages.productImage4,
          description: 'Adidas running shoes in blue color.',
          attributeValues: {'Color': 'Blue', 'Size': 'EU 41'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 30,
          price: 120,
          image: TImages.productImage5,
          attributeValues: {'Color': 'Black', 'Size': 'EU 40'},
        ),
      ],
      productType: ProductType.variable,
    ),
    // ProductModel(
    //   id: '21',
    //   title: 'Apple Watch Series 6',
    //   stock: 20,
    //   price: 400,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage4,
    //   description: 'Latest Apple Watch with health tracking features.',
    //   brand: BrandModel(
    //     id: '3',
    //     image: TImages.appleLogo,
    //     name: 'Apple',
    //     productsCount: 150,
    //     isFeatured: true,
    //   ),
    //   salePrice: 350,
    //   sku: 'AW6789',
    //   categoryId: '2',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Color', values: ['Silver', 'Space Gray']),
    //     ProductAttributeModel(name: 'Size', values: ['40mm', '44mm']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 10,
    //       price: 400,
    //       salePrice: 370,
    //       image: TImages.productImage4,
    //       description: 'Silver Apple Watch Series 6, 40mm.',
    //       attributeValues: {'Color': 'Silver', 'Size': '40mm'},
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 10,
    //       price: 400,
    //       image: TImages.productImage5,
    //       attributeValues: {'Color': 'Space Gray', 'Size': '44mm'},
    //     ),
    //   ],
    //   productType: ProductType.variable,
    // ),
    // ProductModel(
    //   id: '22',
    //   title: 'Nike Sports Jacket',
    //   stock: 15,
    //   price: 85,
    //   isFeatured: false,
    //   thumbnail: TImages.productImage6,
    //   description: 'Lightweight Nike sports jacket for active wear.',
    //   brand: BrandModel(
    //     id: '1',
    //     image: TImages.nikeLogo,
    //     name: 'Nike',
    //     productsCount: 200,
    //     isFeatured: true,
    //   ),
    //   salePrice: 75,
    //   sku: 'NJ2345',
    //   categoryId: '1',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Color', values: ['Red', 'Green']),
    //     ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 5,
    //       price: 85,
    //       salePrice: 80,
    //       image: TImages.productImage6,
    //       description: 'Red Nike sports jacket, size M.',
    //       attributeValues: {'Color': 'Red', 'Size': 'M'},
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 10,
    //       price: 85,
    //       image: TImages.productImage7,
    //       attributeValues: {'Color': 'Green', 'Size': 'L'},
    //     ),
    //   ],
    //   productType: ProductType.variable,
    // ),
    // ProductModel(
    //   id: '23',
    //   title: 'Puma Running Tights',
    //   stock: 30,
    //   price: 50,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage8,
    //   description: 'Comfortable Puma running tights for women.',
    //   brand: BrandModel(
    //     id: '4',
    //     image: TImages.pumaLogo,
    //     name: 'Puma',
    //     productsCount: 120,
    //     isFeatured: false,
    //   ),
    //   salePrice: 40,
    //   sku: 'PT1234',
    //   categoryId: '4',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Color', values: ['Black', 'Purple']),
    //     ProductAttributeModel(name: 'Size', values: ['S', 'M']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 15,
    //       price: 50,
    //       salePrice: 45,
    //       image: TImages.productImage8,
    //       description: 'Black Puma running tights, size S.',
    //       attributeValues: {'Color': 'Black', 'Size': 'S'},
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 15,
    //       price: 50,
    //       image: TImages.productImage9,
    //       attributeValues: {'Color': 'Purple', 'Size': 'M'},
    //     ),
    //   ],
    //   productType: ProductType.variable,
    // ),
    // ProductModel(
    //   id: '24',
    //   title: 'Ikea Desk Lamp',
    //   stock: 25,
    //   price: 35,
    //   isFeatured: false,
    //   thumbnail: TImages.productImage10,
    //   description: 'Stylish Ikea desk lamp for home or office.',
    //   brand: BrandModel(
    //     id: '8',
    //     image: TImages.ikeaLogo,
    //     name: 'Ikea',
    //     productsCount: 180,
    //     isFeatured: true,
    //   ),
    //   salePrice: 30,
    //   sku: 'IDL2345',
    //   categoryId: '5',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Color', values: ['White', 'Black']),
    //     ProductAttributeModel(name: 'Wattage', values: ['5W', '10W']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 15,
    //       price: 35,
    //       salePrice: 30,
    //       image: TImages.productImage10,
    //       description: 'White Ikea desk lamp, 5W.',
    //       attributeValues: {'Color': 'White', 'Wattage': '5W'},
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 10,
    //       price: 35,
    //       image: TImages.productImage11,
    //       attributeValues: {'Color': 'Black', 'Wattage': '10W'},
    //     ),
    //   ],
    //   productType: ProductType.variable,
    // ),
    // ProductModel(
    //   id: '25',
    //   title: 'Herman Miller Office Chair',
    //   stock: 10,
    //   price: 500,
    //   isFeatured: true,
    //   thumbnail: TImages.productImage12,
    //   description: 'Ergonomic office chair by Herman Miller.',
    //   brand: BrandModel(
    //     id: '7',
    //     image: TImages.hermanMillerLogo,
    //     name: 'Herman Miller',
    //     productsCount: 90,
    //     isFeatured: false,
    //   ),
    //   salePrice: 450,
    //   sku: 'HM9876',
    //   categoryId: '6',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Color', values: ['Black', 'Gray']),
    //     ProductAttributeModel(name: 'Material', values: ['Mesh', 'Leather']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 5,
    //       price: 500,
    //       salePrice: 480,
    //       image: TImages.productImage12,
    //       description: 'Black Herman Miller chair, mesh material.',
    //       attributeValues: {'Color': 'Black', 'Material': 'Mesh'},
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 5,
    //       price: 500,
    //       image: TImages.productImage13,
    //       attributeValues: {'Color': 'Gray', 'Material': 'Leather'},
    //     ),
    //   ],
    //   productType: ProductType.variable,
    // ),
    // ProductModel(
    //   id: '26',
    //   title: 'Kenwood Mixer',
    //   stock: 8,
    //   price: 150,
    //   isFeatured: false,
    //   thumbnail: TImages.productImage14,
    //   description: 'High-performance Kenwood kitchen mixer.',
    //   brand: BrandModel(
    //     id: '6',
    //     image: TImages.kenwoodLogo,
    //     name: 'Kenwood',
    //     productsCount: 200,
    //     isFeatured: false,
    //   ),
    //   salePrice: 130,
    //   sku: 'KM4567',
    //   categoryId: '7',
    //   productAttributes: [
    //     ProductAttributeModel(name: 'Color', values: ['White', 'Red']),
    //     ProductAttributeModel(name: 'Power', values: ['500W', '1000W']),
    //   ],
    //   productVariations: [
    //     ProductVariationModel(
    //       id: '1',
    //       stock: 3,
    //       price: 150,
    //       salePrice: 140,
    //       image: TImages.productImage14,
    //       description: 'White Kenwood mixer, 500W.',
    //       attributeValues: {'Color': 'White', 'Power': '500W'},
    //     ),
    //     ProductVariationModel(
    //       id: '2',
    //       stock: 5,
    //       price: 150,
    //       image: TImages.productImage15,
    //       attributeValues: {'Color': 'Red', 'Power': '1000W'},
    //     ),
    //   ],
    //   productType: ProductType.variable,
    // ),
  ];

  // Cart
  // static final CartModel cart = CartModel(
  //   cartID: '001',
  //   items: [
  //     CartItemModel(
  //       productID: '001',
  //       variationID: '1',
  //       quantity: 1,
  //       title: products[0].title,
  //       image: products[0].thumbnail,
  //       brand: products[0].brand!.name,
  //       price: products[0].productVariations![0].price,
  //       selectedVariation: products[0].productVariations![0].attributeValues,
  //     ),
  //     CartItemModel(
  //       productID: '002',
  //       variationID: '2',
  //       quantity: 2,
  //       title: products[1].title,
  //       image: products[1].thumbnail,
  //       brand: products[1].brand!.name,
  //       price: products[1].productVariations![1].price,
  //       selectedVariation: products[1].productVariations![1].attributeValues,
  //     ),
  //   ],
  // );

  static final List<BrandModel> dummyBrands = [
    BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike', productsCount: 265, isFeatured: true),
    BrandModel(id: '2', image: TImages.adidasLogo, name: 'Adidas', productsCount: 95, isFeatured: true),
    BrandModel(id: '8', image: TImages.kenwoodLogo, name: 'Kenwood', productsCount: 36, isFeatured: false),
    BrandModel(id: '9', image: TImages.ikeaLogo, name: 'IKEA', productsCount: 36, isFeatured: false),
    BrandModel(id: '5', image: TImages.appleLogo, name: 'Apple', productsCount: 16, isFeatured: true),
    BrandModel(id: '10', image: TImages.acerlogo, name: 'Acer', productsCount: 36, isFeatured: false),
    BrandModel(id: '3', image: TImages.jordanLogo, name: 'Jordan', productsCount: 36, isFeatured: true),
    BrandModel(id: '4', image: TImages.pumaLogo, name: 'Puma', productsCount: 65, isFeatured: true),
    BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA', productsCount: 36, isFeatured: true),
    BrandModel(id: '7', image: TImages.electronicsIcon, name: 'Samsung', productsCount: 36, isFeatured: false),
  ];

  ///-- List of all Brand Categories
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '8'),
    BrandCategoryModel(brandId: '1', categoryId: '9'),
    BrandCategoryModel(brandId: '1', categoryId: '10'),
    BrandCategoryModel(brandId: '2', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '8'),
    BrandCategoryModel(brandId: '2', categoryId: '9'),
    BrandCategoryModel(brandId: '2', categoryId: '10'),
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '3', categoryId: '8'),
    BrandCategoryModel(brandId: '3', categoryId: '9'),
    BrandCategoryModel(brandId: '3', categoryId: '10'),
    BrandCategoryModel(brandId: '4', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '8'),
    BrandCategoryModel(brandId: '4', categoryId: '9'),
    BrandCategoryModel(brandId: '4', categoryId: '10'),
    BrandCategoryModel(brandId: '5', categoryId: '15'),
    BrandCategoryModel(brandId: '5', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '14'),
    BrandCategoryModel(brandId: '6', categoryId: '3'),
    BrandCategoryModel(brandId: '6', categoryId: '16'),
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    BrandCategoryModel(brandId: '8', categoryId: '5'),
    BrandCategoryModel(brandId: '8', categoryId: '11'),
    BrandCategoryModel(brandId: '8', categoryId: '12'),
    BrandCategoryModel(brandId: '8', categoryId: '13'),
    BrandCategoryModel(brandId: '9', categoryId: '5'),
    BrandCategoryModel(brandId: '9', categoryId: '11'),
    BrandCategoryModel(brandId: '9', categoryId: '12'),
    BrandCategoryModel(brandId: '9', categoryId: '13'),
  ];
  static final List<ProductCategoryModel> productCategories = [
    ProductCategoryModel(productId: '001', categoryId: '1'),
    ProductCategoryModel(productId: '001', categoryId: '8'),
    ProductCategoryModel(productId: '004', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '16'),
    ProductCategoryModel(productId: '003', categoryId: '3'),
    ProductCategoryModel(productId: '005', categoryId: '1'),
    ProductCategoryModel(productId: '005', categoryId: '8'),
    ProductCategoryModel(productId: '040', categoryId: '2'),
    ProductCategoryModel(productId: '040', categoryId: '15'),
    ProductCategoryModel(productId: '006', categoryId: '2'),
    ProductCategoryModel(productId: '007', categoryId: '4'),
    ProductCategoryModel(productId: '009', categoryId: '1'),
    ProductCategoryModel(productId: '009', categoryId: '8'),
    ProductCategoryModel(productId: '010', categoryId: '1'),
    ProductCategoryModel(productId: '010', categoryId: '8'),
    ProductCategoryModel(productId: '011', categoryId: '1'),
    ProductCategoryModel(productId: '011', categoryId: '8'),
    ProductCategoryModel(productId: '012', categoryId: '1'),
    ProductCategoryModel(productId: '012', categoryId: '8'),
    ProductCategoryModel(productId: '013', categoryId: '1'),
    ProductCategoryModel(productId: '013', categoryId: '8'),
    ProductCategoryModel(productId: '014', categoryId: '1'),
    ProductCategoryModel(productId: '014', categoryId: '9'),
    ProductCategoryModel(productId: '015', categoryId: '1'),
    ProductCategoryModel(productId: '017', categoryId: '9'),
    ProductCategoryModel(productId: '018', categoryId: '1'),
    ProductCategoryModel(productId: '018', categoryId: '10'),
    ProductCategoryModel(productId: '019', categoryId: '1'),
    ProductCategoryModel(productId: '019', categoryId: '10'),
    ProductCategoryModel(productId: '020', categoryId: '1'),
    ProductCategoryModel(productId: '020', categoryId: '10'),
    ProductCategoryModel(productId: '021', categoryId: '1'),
    ProductCategoryModel(productId: '021', categoryId: '10'),
    ProductCategoryModel(productId: '022', categoryId: '5'),
    ProductCategoryModel(productId: '022', categoryId: '11'),
    ProductCategoryModel(productId: '023', categoryId: '5'),
    ProductCategoryModel(productId: '023', categoryId: '11'),
    ProductCategoryModel(productId: '024', categoryId: '5'),
    ProductCategoryModel(productId: '024', categoryId: '11'),
    ProductCategoryModel(productId: '025', categoryId: '5'),
    ProductCategoryModel(productId: '025', categoryId: '11'),
    ProductCategoryModel(productId: '026', categoryId: '5'),
    ProductCategoryModel(productId: '026', categoryId: '12'),
    ProductCategoryModel(productId: '027', categoryId: '5'),
    ProductCategoryModel(productId: '027', categoryId: '12'),
    ProductCategoryModel(productId: '028', categoryId: '5'),
    ProductCategoryModel(productId: '028', categoryId: '12'),
    ProductCategoryModel(productId: '029', categoryId: '5'),
    ProductCategoryModel(productId: '029', categoryId: '13'),
    ProductCategoryModel(productId: '030', categoryId: '5'),
    ProductCategoryModel(productId: '030', categoryId: '13'),
    ProductCategoryModel(productId: '031', categoryId: '5'),
    ProductCategoryModel(productId: '031', categoryId: '13'),
    ProductCategoryModel(productId: '032', categoryId: '5'),
    ProductCategoryModel(productId: '032', categoryId: '13'),
    ProductCategoryModel(productId: '033', categoryId: '2'),
    ProductCategoryModel(productId: '033', categoryId: '14'),
    ProductCategoryModel(productId: '034', categoryId: '2'),
    ProductCategoryModel(productId: '034', categoryId: '14'),
    ProductCategoryModel(productId: '035', categoryId: '2'),
    ProductCategoryModel(productId: '035', categoryId: '14'),
    ProductCategoryModel(productId: '036', categoryId: '2'),
    ProductCategoryModel(productId: '036', categoryId: '14'),
    ProductCategoryModel(productId: '037', categoryId: '2'),
    ProductCategoryModel(productId: '037', categoryId: '15'),
    ProductCategoryModel(productId: '038', categoryId: '2'),
    ProductCategoryModel(productId: '038', categoryId: '15'),
    ProductCategoryModel(productId: '039', categoryId: '2'),
    ProductCategoryModel(productId: '039', categoryId: '15'),
    ProductCategoryModel(productId: '008', categoryId: '2'),
  ];

  // List of all Categories
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', image: TImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(id: '5', image: TImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: '2', image: TImages.electronicsIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: '3', image: TImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(id: '4', image: TImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(id: '6', image: TImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '7', image: TImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(id: '14', image: TImages.jeweleryIcon, name: 'Jewelry', isFeatured: true),
  ];

  // sport Subcategories
  static final List<CategoryModel> sportsCategories = [
    CategoryModel(id: '8', image: TImages.productImage1, name: 'Sport Shoes', parentId: '1', isFeatured: false),
    CategoryModel(id: '9', image: TImages.productImage24, name: 'Track suits', parentId: '1', isFeatured: false),
    CategoryModel(id: '10', image: TImages.productImage29, name: 'Sports Equipments', parentId: '1', isFeatured: false),
  ];

  // Furniture Subcategories
  static final List<CategoryModel> furnitureCategories = [
    CategoryModel(id: '11', image: TImages.productImage32, name: 'Bedroom furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '12', image: TImages.productImage33, name: 'Kitchen furniture', parentId: '5', isFeatured: false),
    CategoryModel(id: '13', image: TImages.productImage34, name: 'Office furniture', parentId: '5', isFeatured: false),
  ];

  //Electronics Subcategories
  static final List<CategoryModel> electronicsCategories = [
    CategoryModel(id: '15', image: TImages.productImage11, name: 'Mobile Phones', parentId: '2', isFeatured: false),
    CategoryModel(id: '16', image: TImages.productImage47, name: 'Laptops', parentId: '2', isFeatured: false),
    CategoryModel(id: '17', image: TImages.productImage48, name: 'Cameras', parentId: '2', isFeatured: false),
  ];
  static final List<CategoryModel> clothesCategories = [
    CategoryModel(id: '18', image: TImages.productImage5, name: 'Men\'s Clothing', parentId: '3', isFeatured: false),
    CategoryModel(id: '19', image: TImages.productImage5, name: 'Women\'s Clothing', parentId: '3', isFeatured: false),
    CategoryModel(id: '20', image: TImages.productImage5, name: 'Kid\'s Clothing', parentId: '3', isFeatured: false),
  ];

  static final List<CategoryModel> animalsCategories = [
    CategoryModel(id: '21', image: TImages.productImage18, name: 'Pets', parentId: '4', isFeatured: false),
    CategoryModel(id: '22', image: TImages.productImage18, name: 'Pet Food', parentId: '4', isFeatured: false),
    CategoryModel(id: '23', image: TImages.productImage18, name: 'Pet Accessories', parentId: '4', isFeatured: false),
  ];

  static final List<CategoryModel> shoesCategories = [
    CategoryModel(id: '24', image: TImages.productImage1, name: 'Men\'s Shoes', parentId: '6', isFeatured: false),
    CategoryModel(id: '25', image: TImages.productImage1, name: 'Women\'s Shoes', parentId: '6', isFeatured: false),
    CategoryModel(id: '26', image: TImages.productImage1, name: 'Kid\'s Shoes', parentId: '6', isFeatured: false),
  ];

  static final List<CategoryModel> cosmeticsCategories = [
    CategoryModel(id: '27', image: TImages.productImage18, name: 'Makeup', parentId: '7', isFeatured: false),
    CategoryModel(id: '28', image: TImages.productImage18, name: 'Skincare', parentId: '7', isFeatured: false),
    CategoryModel(id: '29', image: TImages.productImage18, name: 'Fragrances', parentId: '7', isFeatured: false),
  ];

  static final List<CategoryModel> jewelryCategories = [
    CategoryModel(id: '30', image: TImages.productImage1, name: 'Necklaces', parentId: '14', isFeatured: false),
    CategoryModel(id: '31', image: TImages.productImage29, name: 'Rings', parentId: '14', isFeatured: false),
    CategoryModel(id: '32', image: TImages.productImage30, name: 'Bracelets', parentId: '14', isFeatured: false),
  ];
}

class CartModel {
  final String cartID;
  final List<CartItemModel> items;

  CartModel({
    required this.cartID,
    required this.items,
  });

  double get totalPrice => items.fold(0, (total, current) => total + (current.price * current.quantity));
}

class CartItemModel {
  final String productID;
  final String variationID;
  final int quantity;
  final String title;
  final String image;
  final String brand;
  final double price;
  final List<String> selectedVariation;

  CartItemModel({
    required this.productID,
    required this.variationID,
    required this.quantity,
    required this.title,
    required this.image,
    required this.brand,
    required this.price,
    required this.selectedVariation,
  });
}

class ProductImages {
  static const String acerLaptop1 = "assets/images/products/acer_laptop_1.png";
  static const String acerLaptop2 = "assets/images/products/acer_laptop_2.png";
  static const String acerLaptop3 = "assets/images/products/acer_laptop_3.png";
  static const String acerLaptop4 = "assets/images/products/acer_laptop_4.png";

  static const String acerLaptopVar1 = "assets/images/products/acer_laptop_var_1.png";
  static const String acerLaptopVar2 = "assets/images/products/acer_laptop_var_2.png";
  static const String acerLaptopVar3 = "assets/images/products/acer_laptop_var_3.png";
  static const String acerLaptopVar4 = "assets/images/products/acer_laptop_var_4.png";

  static const String bedroomBed = "assets/images/products/bedroom_bed.png";
  static const String bedroomBedBlack = "assets/images/products/bedroom_bed_black.png";
  static const String bedroomBedGrey = "assets/images/products/bedroom_bed_grey.png";
  static const String bedroomBedSimpleBrown = "assets/images/products/bedroom_bed_simple_brown.png";
  static const String bedroomBedWithComforter = "assets/images/products/bedroom_bed_with_comforter.png";

  static const String bedroomLamp = "assets/images/products/bedroom_lamp.png";
  static const String bedroomSofa = "assets/images/products/bedroom_sofa.png";
  static const String bedroomWardrobe = "assets/images/products/bedroom_wardrobe.png";

  static const String iphone12Blue = "assets/images/products/iphone_12_blue.png";
  static const String iphone12Green = "assets/images/products/iphone_12_green.png";
  static const String iphone12Red = "assets/images/products/iphone_12_red.png";
  static const String iphone12Black = "assets/images/products/iphone_12_black.png";
  static const String iphone13Pro = "assets/images/products/iphone_13_pro.png";
  static const String iphone14White = "assets/images/products/iphone_14_white.png";
  static const String iphone14Pro = "assets/images/products/iphone_14_pro.png";
  static const String iphone8Mobile = "assets/images/products/iphone8_mobile.png";
  static const String iphone8MobileBack = "assets/images/products/iphone8_mobile_back.png";
  static const String iphone8MobileDualSide = "assets/images/products/iphone8_mobile_dual_side.png";
  static const String iphone8MobileFront = "assets/images/products/iphone8_mobile_front.png";

  static const String kitchenCounter = "assets/images/products/kitchen_counter.png";
  static const String kitchenDiningTable = "assets/images/products/kitchen dining table.png";
  static const String kitchenRefrigerator = "assets/images/products/kitchen_refrigerator.png";

  static const String leatherJacket1 = "assets/images/products/leather_jacket_1.png";
  static const String leatherJacket2 = "assets/images/products/leather_jacket_2.png";
  static const String leatherJacket3 = "assets/images/products/leather_jacket_3.png";
  static const String leatherJacket4 = "assets/images/products/leather_jacket_4.png";

  static const String nikeAirJordonSingleOrange = "assets/images/products/NikeAirJordonSingleOrange.png";
  static const String nikeAirJordonSingleBlue = "assets/images/products/NikeAirJordonSingleBlue.png";
  static const String nikeAirJOrdonBlackRed = "assets/images/products/NikeAirJOrdonBlackRed.png";
  static const String nikeAirJOrdonWhiteRed = "assets/images/products/NikeAirJOrdonWhiteRed.png";
  static const String nikeAirMax = "assets/images/products/NikeAirMax.png";
  static const String nikeWildhorse = "assets/images/products/NikeWildhorse.png";
  static const String nikeAirJordonwhiteMagenta = "assets/images/products/NikeAirJordonwhiteMagenta.png";
  static const String nikeAirJordonOrange = "assets/images/products/NikeAirJOrdonOrange.png";

  static const String officeDesk1 = "assets/images/products/office_desk_1.png";
  static const String officeDesk2 = "assets/images/products/office_desk_2.png";
  static const String officeChair1 = "assets/images/products/office chair_1.png";
  static const String officeChair2 = "assets/images/products/office chair_2.png";

  static const String product1 = "assets/images/products/product-1.png";
  static const String productShirt = "assets/images/products/product-shirt.png";
  static const String productShirtBlue1 = "assets/images/products/product-shirt_blue_1.png";
  static const String productShirtBlue2 = "assets/images/products/product-shirt_blue_2.png";
  static const String productJeans = "assets/images/products/product-jeans.png";
  static const String productJacket = "assets/images/products/product-jacket.png";
  static const String productSlippers = "assets/images/products/product-slippers.png";

  static const String promoBanner1 = "assets/images/products/promo-banner-1.png";
  static const String promoBanner2 = "assets/images/products/promo-banner-2.png";
  static const String promoBanner3 = "assets/images/products/promo-banner-3.png";

  static const String slipperProduct1 = "assets/images/products/slipper-product-1.png";
  static const String slipperProduct2 = "assets/images/products/slipper-product-2.png";
  static const String slipperProduct3 = "assets/images/products/slipper-product-3.png";
  static const String slipperProduct = "assets/images/products/slipper-product.png";

  static const String tracksuitBlack = "assets/images/products/tracksuit_black.png";
  static const String tracksuitBlue = "assets/images/products/tracksuit_blue.png";
  static const String tracksuitRed = "assets/images/products/tracksuit_red.png";
  static const String tracksuitParrotGreen = "assets/images/products/trcksuit parrotgreen.png";

  static const String tshirtBlueWithoutCollarBack = "assets/images/products/tshirt_blue_without_collar_back.png";
  static const String tshirtBlueWithoutCollarFront = "assets/images/products/tshirt_blue_without_collar_front.png";
  static const String tshirtBlueCollar = "assets/images/products/tshirt_blue_collar.png";
  static const String tshirtGreenCollar = "assets/images/products/tshirt_green_collar.png";
  static const String tshirtRedCollar = "assets/images/products/tshirt_red_collar.png";
  static const String tshirtYellowCollar = "assets/images/products/tshirt_yellow_collar.png";

  static const String userImg = "assets/images/products/user_img.jpg";

  static const String cricketBat = "assets/images/products/cricket_bat.png";
  static const String baseballBat = "assets/images/products/baseball_bat.png";
  static const String tennisRacket = "assets/images/products/tennis_racket.png";
  static const String tomiDogFood = "assets/images/products/tomi_dogfood.png";
}
