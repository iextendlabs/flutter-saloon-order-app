import 'package:flutter/material.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class CustomSearchBar extends StatefulWidget {
  final String hintText;
  final Function(String) onChanged ;
  CustomSearchBar({required this.hintText, required this.onChanged});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  String searchText='';

  @override
  Widget build(BuildContext context) {

    return Container(
          height: TSizes.searchBarHeight,
          child: TextField(
            controller:
                TextEditingController(text: searchText),
            onChanged: (value) {
              searchText= value;
              widget.onChanged(value);
            },
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: const TextStyle(color: TColors.gray),
              prefixIcon: const Icon(Icons.search),
              prefixIconColor:  searchText.isNotEmpty ? TColors.black : TColors.gray,
              suffixIcon: searchText.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear, color: Colors.black),
                      onPressed: (){
                        searchText = '';
                        widget.onChanged('');
                        setState(() {

                        });
                      })
                  : null,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: TColors.gray)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: TColors.black)),
              focusColor: TColors.black,
              fillColor: Colors.transparent,
              filled: true,
            ),
            style: TextStyle(
                color: searchText.isNotEmpty
                    ? TColors.black
                    : TColors.gray,
                fontSize: TSizes.fontSizeMd),
          ),
        );
  }
}
