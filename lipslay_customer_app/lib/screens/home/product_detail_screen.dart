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
import 'package:lipslay_customer_app/models/offer_product.dart';
import 'package:lipslay_customer_app/utils/constants/assets.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import '../../common/components/services_offer.dart';
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
  List<OfferProduct> addOns = [];
  List<OfferProduct> packages = [];

  @override
  void initState() {
    super.initState();
    LoadData();
  }

  Future<void> LoadData() async {
    isLoading = true;
    productDetail = await _controller.fetchDataWithURL(
        ApiUrls.serviceDetailUrl + widget.productId.toString());
    final addOnIds = productDetail['addONs']
        .map((addOn) => addOn['add_on_id'].toString())
        .toSet();

    addOns = _controller.allServices
        .where((service) => addOnIds.contains(service.id.toString()))
        .toList();

    final packagesIds = productDetail['package']
        .map((addOn) => addOn['package_id'].toString())
        .toSet();

    packages = _controller.allServices
        .where((service) => packagesIds.contains(service.id.toString()))
        .toList();
    print(addOns.length);
    print(packages.length);

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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(TSizes.borderRadiusLg),
                      child: CustomImage(
                        url: ApiUrls.serviceImagesURL +
                            productDetail['services']['image'],
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: TSizes.sm),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                    child: Row(
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
                              style:
                                  const TextStyle(fontSize: TSizes.fontSizeLg),
                            ),
                            const SizedBox(width: TSizes.spaceBtwItems),
                            const ShareButton(),
                            const SizedBox(width: TSizes.spaceBtwItems),
                            const WishlistButton()
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const RatingStars(rating: 4.5, color: TColors.black),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                    child: TButton(
                      text: 'Book Now',
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const SectionTitle(
                      title: 'Details',
                      icon: Icons.description,
                      showIcon: true),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                    child: HtmlWidget(
                      productDetail['services']['description'],
                    ),
                  ),
                  const SizedBox(height: 20),
                  productDetail['faqs'].length > 0
                      ? const SectionTitle(
                          title: 'Frequently asked questions',
                          icon: Icons.question_answer_outlined,
                          showIcon: true)
                      : const SizedBox.shrink(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: productDetail['faqs'].length,
                      itemBuilder: (context, index) {
                        final item = productDetail['faqs'][index];
                        return Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: TSizes.xs),
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
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  addOns.isNotEmpty
                      ? const SectionTitle(
                          title: 'Add-ons',
                          icon: Icons.add_circle_outline,
                          showIcon: true)
                      : const SizedBox.shrink(),
                  addOns.isNotEmpty
                      ? ServicesOffer(products: addOns)
                      : const SizedBox.shrink(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  packages.isNotEmpty
                      ? const SectionTitle(
                          title: 'Packages',
                          icon: Icons.card_giftcard,
                          showIcon: true)
                      : const SizedBox.shrink(),
                  packages.isNotEmpty
                      ? ServicesOffer(products: packages)
                      : const SizedBox.shrink(),
                ],
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
      this.fit = BoxFit.cover,  this.height});

  final String url;
  final double? width;
  final double? height;

  final BoxFit fit;
bool hasHeight = false;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      width: width,
      height: height,
      imageUrl: url,
      placeholder: (context, url) =>
          const Image(image: AssetImage(Assets.placeholder), fit: BoxFit.cover),
      errorWidget: (context, url, error) =>
          const Image(image: AssetImage(Assets.placeholder), fit: BoxFit.cover),
    );
  }
}
