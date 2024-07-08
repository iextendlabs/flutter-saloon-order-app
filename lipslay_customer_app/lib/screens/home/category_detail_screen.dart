import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lipslay_customer_app/common/components/services_grid.dart';
import 'package:lipslay_customer_app/common/widgets/loading_spinner.dart';
import 'package:lipslay_customer_app/controllers/data_controller.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../common/components/categories_grid.dart';
import '../../common/widgets/section_title.dart';
import '../../models/category.dart';
import '../../models/offer_product.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CategoryDetailScreen extends StatefulWidget {
  const CategoryDetailScreen({super.key, required this.category});

  final Category category;

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  final DataController _controller = Get.find<DataController>();
  List<Category> subCategories = [];
  List<OfferProduct> offerProducts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    LoadData();
  }

  Future<void> LoadData() async {
    offerProducts = _controller.filterServicesByCategory(widget.category.id);
    subCategories = await _controller.fetchSubCategories(widget.category.id);
    isLoading = false;
    setState(() {});
  }

  @override
  void dispose() {
    offerProducts.clear();
    subCategories.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.title),
        backgroundColor: TColors.primary,
      ),
      body: isLoading
          ? const LoadingSpinner()
          : SingleChildScrollView(
              child: Column(
                children: [

                  subCategories.isNotEmpty?
                  const SectionTitle(
                    title: 'Sub Categories',
                    showIcon: true,
                    icon: Icons.category_outlined,
                    padding: const EdgeInsets.only(left: 8.0),
                  ):const SizedBox.shrink(),
                  const SizedBox(height: 8),
                  subCategories.isNotEmpty
                      ? CategoriesGrid(categories: subCategories)
                      : const SizedBox.shrink(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ServicesGrid(products: offerProducts),
                  const SizedBox(height: TSizes.spaceBtwSections),

                ],
              ),
            ),
    );
  }
}
