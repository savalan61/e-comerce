import '../features/authentication/models/user_model.dart';
import '../features/shop/models/category_mode.dart';
import '../utils/constants/image_strings.dart';

class TDummyData {
//   // Banners
//   static final List<BannerModel> banners = [
//     BannerModel(imageURL: TImages.banner1, targetScreen: "/order", active: false),
//     BannerModel(imageURL: TImages.banner2, targetScreen: "/cart", active: true),
//     BannerModel(imageURL: TImages.banner3, targetScreen: "/favourites", active: true),
//     BannerModel(imageURL: TImages.banner4, targetScreen: "/search", active: true),
//     BannerModel(imageURL: TImages.banner5, targetScreen: "/settings", active: true),
//     BannerModel(imageURL: TImages.banner6, targetScreen: "/userAddress", active: true),
//     BannerModel(imageURL: TImages.banner7, targetScreen: "/checkout", active: false),
//     BannerModel(imageURL: TImages.banner8, targetScreen: "/order", active: true),
//   ];

  // User
  static final UserModel user = UserModel(
    id: 'user001',
    firstName: 'John',
    lastName: 'Doe',
    userName: 'johndoe',
    email: 'johndoe@example.com',
    phoneNumber: '+1234567890',
    profilePicture: 'assets/images/profile_pic.png',
  );

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

// class BannerModel {
//   String imageURL;
//   String targetScreen;
//   bool active;
//   String? imageUrl;
//
//   BannerModel({
//     required this.imageURL,
//     required this.targetScreen,
//     required this.active,
//     this.imageUrl,
//   });
//
//   Map<String, dynamic> toJson() {
//     return {
//       'imageURL': imageURL,
//       'targetScreen': targetScreen,
//       'active': active,
//       'imageUrl': imageUrl,
//     };
//   }
// }

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
