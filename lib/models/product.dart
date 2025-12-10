
class Product {
  final String id;
  String name;
  String description;
  double price;
  String? imageUrl;
  int stock;
  bool isAvailable;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    this.stock = 0,
    this.isAvailable = true,
  });
}
