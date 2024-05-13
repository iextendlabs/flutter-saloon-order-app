import 'package:flutter/material.dart';

class Category {
  final int id;
  final String title;
  final String image;

  Category({required this.id, required this.title, required this.image});

  factory Category.fromJson(Map<String, dynamic> json) {

    return Category(
      id: json['id'] ?? 0, // Assign 0 as default if id is null
      title: json['title'] ?? "",
      image: json['icon'] ?? "", // Concatenate base URL with image URL from JSON, handle null case
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
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