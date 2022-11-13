import 'package:fugi_fic_slicing_furniture/app/models/category.dart';
import 'package:fugi_fic_slicing_furniture/app/models/category_menu.dart';
import 'package:fugi_fic_slicing_furniture/app/models/item.dart';

class Fake {
  static int numberOfItemsInCart = 1;

  static List<Category> categories = [
    Category('assets/icons/chest.svg', 'Living Room'),
    Category('assets/icons/bathtub.svg', 'Bathroom'),
    Category('assets/icons/desk.svg', 'Workspace'),
  ];

  static List<Item> furniture = [
    Item(
      name: 'Stylish Chair',
      imagePath: 'assets/images/furniture/img_product_2.png',
      originalPrice: 170,
      rating: 4.5,
      discountPercent: 30,
    ),
    Item(
      name: 'Modern Table',
      imagePath: 'assets/images/furniture/img_product_3.png',
      originalPrice: 75,
      rating: 4.4,
      discountPercent: 30,
    ),
    Item(
      name: 'Wooden Console',
      imagePath: 'assets/images/furniture/img_product_4.png',
      originalPrice: 210,
      rating: 4.3,
      discountPercent: 25,
    ),
    Item(
      name: 'Brown Armchair',
      imagePath: 'assets/images/furniture/img_product_5.png',
      originalPrice: 140,
      rating: 4.3,
      discountPercent: 20,
    ),
  ];

  List<CategoryMenuModel> categoriesMenu = [
    CategoryMenuModel(
      name: "All",
    ),
    CategoryMenuModel(
      name: "Living Room",
    ),
    CategoryMenuModel(
      name: "Bed Room",
    ),
    CategoryMenuModel(
      name: "Dining Room",
    ),
    CategoryMenuModel(
      name: "Kitchen",
    ),
  ];

  List popularList = [
    {
      "image": "assets/images/furniture/img_product_1.png",
      "name": "Luxury Swedian Chair",
      "price": "899"
    },
    {
      "image": "assets/images/chair2.jpg",
      "name": "Luxury Swedian Chair",
      "price": "1299"
    },
    {
      "image": "assets/images/chair3.jpg",
      "name": "Luxury Swedian Chair",
      "price": "688"
    },
    {
      "image": "assets/images/chair4.jpg",
      "name": "Luxury Swedian Chair",
      "price": "1488"
    },
  ];
}
