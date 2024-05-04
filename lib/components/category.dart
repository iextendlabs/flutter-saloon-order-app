import 'package:flutter/material.dart';

class Category {
  final String title;
  final String image;

  Category({required this.title, required this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    // Add your base URL here
    String baseUrl = 'https://lipslay.com/service-category-icons/'; // Adjust this to match your actual base URL

    return Category(
      title: json['title'] ?? "",
      image: baseUrl + json['icon'] ?? "", // Concatenate base URL with image URL from JSON
    );
  }

}

class CategoryPage extends StatelessWidget {
  final Category category;

  CategoryPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: Center(
        child: Text('${category.title} Page Content'),
      ),
    );
  }
}