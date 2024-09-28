class VegetableModel {
  final String id;
  final String title;
  final String imageUrl;
  final double price;
  final double salePrice;

  VegetableModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.salePrice,
  });

  factory VegetableModel.fromMap(Map<String, dynamic> data) {
    return VegetableModel(
      id: data['id'],
      title: data['title'],
      imageUrl: data['imageUrl'],
      price: data['price'],
      salePrice: data['salePrice'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'price': price,
      'salePrice': salePrice,
    };
  }
}
