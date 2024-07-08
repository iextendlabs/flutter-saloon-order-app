import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lipslay_customer_app/common/widgets/button.dart';
import 'package:lipslay_customer_app/common/widgets/loading_spinner.dart';
import 'package:lipslay_customer_app/common/widgets/rating_stars.dart';
import 'package:lipslay_customer_app/common/widgets/section_title.dart';
import 'package:lipslay_customer_app/common/widgets/share_button.dart';
import 'package:lipslay_customer_app/common/widgets/wishlisht_button.dart';
import 'package:lipslay_customer_app/config/api_urls.dart';
import 'package:lipslay_customer_app/utils/constants/assets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../controllers/data_controller.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key, this.productId});

  final productId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  bool isLoading = true;

  final DataController _controller = Get.find<DataController>();
  late Map<String, dynamic> productDetail;
  List<String> myArray = ["Apple", "Banana", "Cherry"];

  @override
  void initState() {
    super.initState();
    LoadData();
  }

  Future<void> LoadData() async {
    productDetail = await _controller.fetchDataWithURL(
        ApiUrls.serviceDetailUrl + widget.productId.toString());
    isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primary,
      ),
      backgroundColor: TColors.primary,
      body: isLoading
          ? const LoadingSpinner()
          : SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(TSizes.borderRadiusLg),
                      child: CustomImage(
                        url: ApiUrls.serviceImagesURL +
                            productDetail['services']['image'],
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(height: TSizes.sm),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'AED ' + productDetail['services']['price'],
                          style: const TextStyle(
                              fontSize: TSizes.fontSizeLg,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            const Icon(Icons.watch_later_outlined),
                            const SizedBox(width: 4),
                            Text(
                              productDetail['services']['duration'],
                              style: const TextStyle(fontSize: TSizes.fontSizeLg),
                            ),
                            const SizedBox(width: TSizes.spaceBtwItems),
                            const ShareButton(),
                            const SizedBox(width: TSizes.spaceBtwItems),
                            const WishlistButton()
                          ],
                        ),

                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const RatingStars(rating: 4.5, color: TColors.black),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TButton(
                      text: 'Book Now',
                      onPressed: () {},
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const SectionTitle(
                        title: 'Details',
                        icon: Icons.description,
                        showIcon: true),
                    HtmlWidget(
                      productDetail['services']['description'],
                    ),
                    const SizedBox(height: 20),
                    const SectionTitle(
                        title: 'Frequently asked questions',
                        icon: Icons.question_answer_outlined,
                        showIcon: true),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: productDetail['faqs'].length,
                      itemBuilder: (context, index) {
                        final item = productDetail['faqs'][index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: TSizes.xs),
                          child: ExpansionTile(
                            collapsedBackgroundColor: TColors.pinkAccent,
                            backgroundColor: TColors.pinkAccent,
                            collapsedTextColor: TColors.white,
                            textColor: TColors.white,
                            collapsedIconColor: TColors.white,
                            iconColor: TColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            collapsedShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6)),
                            title: Text(item['question']),
                            children: <Widget>[
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                color: Colors.white,
                                child: Text(item['answer']),
                              )
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CustomImage extends StatelessWidget {
  CustomImage(
      {super.key,
      required this.url,
      this.width = double.infinity,
      this.fit = BoxFit.cover});

  final String url;
  final double width;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      width: width,
      imageUrl: url,
      placeholder: (context, url) =>
          const Image(image: AssetImage(Assets.placeholder), fit: BoxFit.cover),
      errorWidget: (context, url, error) =>
          const Image(image: AssetImage(Assets.placeholder), fit: BoxFit.cover),
    );
  }
}
