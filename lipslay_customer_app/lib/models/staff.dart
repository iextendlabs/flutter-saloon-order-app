class Staff {
  final String imageUrl; // Changed from image to imageUrl
  final String name;
  final double rating;
  final String charges;
  final String subTitle;

  Staff({
    required this.imageUrl, // Changed from image to imageUrl
    required this.name,
    required this.rating,
    required this.charges,
    required this.subTitle,
  });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      imageUrl: json['staff']['image'] ?? "", // Updated imageUrl property
      name: json['name'] ?? "",
      rating: json['staff']['rating'] != null ? double.parse(json['staff']['rating']) : 0.0,
      charges: json['staff']['charges'] ?? "",
      subTitle: json['staff']['sub_title'] ?? "",
    );
  }
}