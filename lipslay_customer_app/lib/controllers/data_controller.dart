import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../config/api_urls.dart';
import '../models/category.dart';
import '../models/offer_product.dart';
import '../models/staff.dart';

class DataController extends GetxController {
  final RxBool isLoading = RxBool(false); // Flag for loading state

  List<String> images = [];
  List<Category> categories = [];
  List<OfferProduct> allServices = [];
  List<OfferProduct> offerProducts = [];
  List<Staff> staff = [];

  Future<void> fetchData() async {
    isLoading.value = true;
    final response = await http.get(Uri.parse(ApiUrls.appDataUrl));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);

      List<String> featuredServices =
          List<String>.from(jsonData['featured_services']);

      images = (jsonData['images'] as List<dynamic>).map<String>((item) {
        final parts = item.split('_');
        final imageName = parts.last;
        return ApiUrls.baseUrl + 'slider-images/$imageName';
      }).toList();

      categories =
          (jsonData['categories'] as List<dynamic>).map<Category>((item) {
            item['icon'] = ApiUrls.baseUrl+'service-category-icons/'+item['icon'];
            return Category.fromJson(item);
      }).toList();

      allServices =
          (jsonData['services'] as List<dynamic>).map<OfferProduct>((item) {
        return OfferProduct.fromJson(item);
      }).toList();

      offerProducts = (jsonData['services'] as List<dynamic>)
          .map<OfferProduct>((item) {
            if (featuredServices.contains(item['id'].toString())) {
              return OfferProduct.fromJson(item);
            } else {
              return OfferProduct(
                id: item['id'] ?? 0,
                image: '',
                name: '',
                rating: 0.0,
                price: '',
                discount: '',
                duration: '',
                categoryId: [],
              );
            }
          })
          .where((element) => element.image.isNotEmpty)
          .toList();

      staff = (jsonData['staffs'] as List<dynamic>).map<Staff>((item) {
        return Staff.fromJson(item);
      }).toList();

      saveCategories(categories);
      saveServices(allServices);
      isLoading.value = false;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> saveCategories(List<Category> categories) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> categoriesJsonList =
        categories.map((category) => jsonEncode(category.toJson())).toList();
    await prefs.setStringList('categories', categoriesJsonList);
  }

  Future<void> saveServices(List<OfferProduct> services) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> servicesJsonList =
        services.map((service) => jsonEncode(service.toJson())).toList();
    await prefs.setStringList('services', servicesJsonList);
  }
}
