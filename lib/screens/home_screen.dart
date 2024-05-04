import 'package:flutter/material.dart';
import '../components/carousel_slider.dart';
import '../components/category_grid.dart';
import '../components/category.dart';
import '../components/offer_product_card.dart';
import '../components/staff_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [];
  List<Category> categories = [];
  List<OfferProduct> offerProducts = [];
  List<Staff> staff = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('https://lipslay.com/AppData.json'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      List<String> featuredServices = List<String>.from(jsonData['featured_services']);

      setState(() {
        images = (jsonData['images'] as List<dynamic>).map<String>((item) {
          final parts = item.split('_');
          final imageName = parts.last;
          return 'https://lipslay.com/slider-images/$imageName';
        }).toList();

        categories = (jsonData['categories'] as List<dynamic>).map<Category>((item) {
          return Category.fromJson(item);
        }).toList();

        offerProducts = (jsonData['services'] as List<dynamic>).map<OfferProduct>((item) {
          if (featuredServices.contains(item['id'].toString())) {
            return OfferProduct.fromJson(item);
          } else {
            // Create a default OfferProduct for non-featured services
            return OfferProduct(
              image: '', // Add default values for other properties
              name: '',
              rating: 0.0,
              price: '',
              discount: '',
              duration: '',
            );
          }
        }).where((element) => element.image.isNotEmpty).toList(); // Exclude non-featured services

        staff = (jsonData['staffs'] as List<dynamic>).map<Staff>((item) {
          return Staff.fromJson(item);
        }).toList();

        isLoading = false; // Set loading to false once data is fetched
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CarouselSliderWidget(images: images),
          SizedBox(height: 20.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: ElevatedButton(
              onPressed: () {
                // Navigate to Check Booking page
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15.0),
                primary: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Check Booking',
                style: TextStyle(fontSize: 16.0, color: Colors.white),
              ),
            ),
          ),
          _buildSectionTitle('What are you looking for?'), // Title for Offers section
          CategoryGridWidget(categories: categories),
          _buildSectionTitle('Time Limited Offers'), // Title for Offers section
          SizedBox(
            height: 330.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: offerProducts.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: OfferProductCard(offerProduct: offerProducts[index]),
                );
              },
            ),
          ),
          _buildSectionTitle('Our Staff'), // Title for Staff section
          SizedBox(
            height: 280.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: staff.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: StaffCard(staff: staff[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.extension,
            color: Colors.pink,
            size: 20.0,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'LipSlay Home Services',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xFFfdc8cd),
      ),
      body: isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : _buildContent(),
    );
  }
}
