class Category {
  final int id;
  final String title;
  final String image;
  final String icon;

  Category({required this.id, required this.title, required this.image, required this.icon});

  factory Category.fromJson(Map<String, dynamic> json) {

    return Category(
      id: json['id'] ?? 0, // Assign 0 as default if id is null
      title: json['title'] ?? "",
      image: json['image'] ?? "", // Concatenate base URL with image URL from JSON, handle null case
      icon: json['icon'] ?? "",

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'icon':icon
    };
  }
}