import 'package:flutter/material.dart';
import 'package:lipslay_customer_app/common/widgets/custom_app_bar.dart';
import 'package:lipslay_customer_app/common/widgets/custom_search_bar.dart';
import 'package:lipslay_customer_app/utils/constants/text_strings.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
          title: TTexts.appBarSearchScreenTitle,
          description: TTexts.appBarSearchScreenDescription),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
             CustomSearchBar(hintText: TTexts.searchServicesHint),
          ],
        ),
      ),
    );
  }
}
