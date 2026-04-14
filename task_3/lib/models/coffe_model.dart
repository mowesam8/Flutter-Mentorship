class CoffeModel {
  final String imagePath;
  final String title;
  final String subtitle;
  final List<String> price;
  final String rate;
  final String category;

  CoffeModel({
    required this.imagePath,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.category,
    required this.rate,
  });
}

List<CoffeModel> coffes = [
  CoffeModel(
    imagePath: "assets/images/coffe1.png",
    title: "Coffe Moch",
    subtitle: "Deep Foam",
    price: ["3.53","4.53", "5.53"],
    category: "Machiato",
    rate: "4.8",
  ),

  CoffeModel(
    imagePath: "assets/images/coffe2.png",
    title: "Flat White",
    subtitle: "Espresso",
    price: ["2.53","3.53", "4.53"],
    category: "Latte",
    rate: "4.75",
  ),

  CoffeModel(
    imagePath: "assets/images/coffe3.png",
    title: "Mocha Fusi",
    subtitle: "Ice/Hot",
    price: ["6.53","7.53", "8.53"],
    category: "Latte",
    rate: "4.85",
  ),

  CoffeModel(
    imagePath: "assets/images/coffe4.png",
    title: "Caffe Panna",
    subtitle: "Ice/Hot",
    price: ["4.53","5.53","6.53"],
    category: "Americano",
    rate: "4.9",
  ),
];
