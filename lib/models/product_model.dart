class Product {
  final String id;
  String name;
  String description;
  double price;
  String imageUrl;
  bool isAvailable;
  int stock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isAvailable = true,
    this.stock = 100,
  });
}
