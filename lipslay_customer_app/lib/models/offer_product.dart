class OfferProduct {
  final int id;
  final String image;
  final String name;
  final double rating;
  final String price;
  final String discount;
  final String duration;
  final List<int> categoryId;

  OfferProduct({
    required this.id,
    required this.image,
    required this.name,
    required this.rating,
    required this.price,
    required this.discount,
    required this.duration,
    required this.categoryId,
  });

  factory OfferProduct.fromJson(Map<String, dynamic> json) {
    List<int> categoryIdList = List<int>.from(json['category_id'] ?? []);
    return OfferProduct(
      id: json['id'] ?? 0, // Parse id as integer, defaulting to 0 if null
      image: json['image'] ?? '',
      name: json['name'] ?? '',
      rating: json['rating'] != null ? double.parse(json['rating'].toString()) : 0.0,
      price: json['price'] ?? '0',
      discount: json['discount'] ?? '0',
      duration: json['duration'] ?? '',
      categoryId: categoryIdList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'image': image,
      'name': name,
      'rating': rating,
      'price': price,
      'discount': discount,
      'duration': duration,
      'category_id': categoryId,
    };
  }
}