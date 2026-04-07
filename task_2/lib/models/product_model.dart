import 'dart:ui';

class ProductModel {
  final String imagePath;
  final String title;
  final String brand;
  final String price;
  final Color backgroundColor;

  ProductModel({
    required this.imagePath,
    required this.title,
    required this.brand,
    required this.price,
    required this.backgroundColor,
  });
}

List<ProductModel> watches = [
  ProductModel(
    imagePath: "assets/images/apple.png",
    title: "Apple Watch SE",
    brand: "Apple",
    price: "\$349.99",
    backgroundColor: Color(0xffffc8b7),
  ),

  ProductModel(
    imagePath: "assets/images/galaxy.png",
    title: "Galaxy Watch 4",
    brand: "Samsung",
    price: "\$249.99",
    backgroundColor: Color(0xffffefe1),
  ),

  ProductModel(
    imagePath: "assets/images/amazfit.png",
    title: "Amazfit GTS 2",
    brand: "Amazfit",
    price: "\$199.99",
    backgroundColor: Color(0xfffcf1f0),
  ),
  
  ProductModel(
    imagePath: "assets/images/galaxy7.png",
    title: "Galaxy Watch 7",
    brand: "Samsung",
    price: "\$279.99",
    backgroundColor: Color(0xfff0decf),
  ),
];
