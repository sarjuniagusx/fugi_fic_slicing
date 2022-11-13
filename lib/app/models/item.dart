class Item {
  String name;
  String imagePath;
  int discountPercent;
  double originalPrice;
  double rating;

  Item({
    required this.name,
    required this.imagePath,
    required this.originalPrice,
    required this.rating,
    required this.discountPercent,
  });

  double get price {
    // ignore: unnecessary_null_comparison
    return discountPercent != null
        ? (originalPrice - (originalPrice * discountPercent / 100))
        : originalPrice;
  }

  static String format(double price) {
    String money = price.toStringAsFixed(2);
    return '\$$money';
  }
}
