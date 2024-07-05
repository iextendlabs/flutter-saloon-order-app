import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBarController extends GetxController {
  var searchText = ''.obs;

  void clearSearch() {
    searchText.value = '';
  }

}
