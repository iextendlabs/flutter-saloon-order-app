import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'controllers/data_controller.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dataController = Get.put<DataController>(DataController());
  await dataController.fetchData();

  runApp(const App());
}