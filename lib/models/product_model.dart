class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final double? oldPrice; // Nouveau: pour afficher la promo
  final int stock;
  final List<String> imageUrls;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.oldPrice,
    required this.stock,
    required this.imageUrls,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      stock: json['stock'],
      imageUrls: List<String>.from(json['image_urls']),
      category: json['category'],
    );
  }
}
