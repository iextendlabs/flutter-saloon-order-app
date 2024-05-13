import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/category.dart';
import '../components/product_card.dart';
import '../components/category_grid.dart';
import '../config/api_urls.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchPage extends StatefulWidget {
  final int categoryId;

  SearchPage({required this.categoryId});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Product> allServices = [];
  List<Product> filteredServices = [];
  String searchQuery = '';
  List<Category> subCategories = [];

  static const String _servicesKey = 'services';

  @override
  void initState() {
    super.initState();
    fetchServicesFromSharedPreferences();
    if (widget.categoryId != 0) {
      fetchSubCategories();
    }
  }

  Future<void> fetchServicesFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final servicesJson = prefs.getStringList(_servicesKey);

    if (servicesJson != null && servicesJson.isNotEmpty) {
      setState(() {
        allServices = servicesJson.map<Product>((jsonString) {
          return Product.fromJson(jsonDecode(jsonString));
        }).toList();
        filteredServices = allServices
            .where((service) => service.categoryId.contains(widget.categoryId))
            .toList();
      });
    }
  }

  Future<void> fetchSubCategories() async {
    final response = await http.get(Uri.parse(ApiUrls.subCategoriesUrl(widget.categoryId)));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      if (jsonData.containsKey('sub_categories')) {
        final subCategoriesData = jsonData['sub_categories'];

        if (subCategoriesData != null) {
          setState(() {
            subCategories = (subCategoriesData as List<dynamic>).map<Category>((item) {
              return Category.fromJson(item);
            }).toList();
          });
        } else {
          print('Subcategories data is null');
        }
      } else {
        print('No subcategories key found');
      }
    } else {
      throw Exception('Failed to load subcategories');
    }
  }

  List<Product> getFilteredServices() {
    if (searchQuery.isEmpty) {
      return [];
    } else {
      return allServices
          .where((service) => service.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        backgroundColor: Color(0xFFfdc8cd),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                  filteredServices = getFilteredServices();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search services...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
            if (widget.categoryId != 0 && subCategories.isNotEmpty)
              SizedBox(height: 20.0),
            CategoryGridWidget(categories: subCategories),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  childAspectRatio: 0.6,
                ),
                itemCount: filteredServices.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: filteredServices[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}