import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lipslay_customer_app/common/widgets/button.dart';
import 'package:lipslay_customer_app/common/widgets/rating_stars.dart';
import 'package:lipslay_customer_app/screens/cart/cart_screen.dart';
import 'package:lipslay_customer_app/utils/constants/sizes.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/text_strings.dart';

class AddToCartScreen extends StatefulWidget {
  const AddToCartScreen({super.key});

  @override
  State<AddToCartScreen> createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 15),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Booking added successfully'),
          actions: [
            TButton(
              text: 'Continue',
              width: 110,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TButton(
              width: 110,
              text: 'Checkout',
              onPressed: () {
                Navigator.of(context).pop();
                Get.to(()=>ShoppingCartScreen());
                // Add your OK button action here
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        backgroundColor: TColors.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: TSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Book Now',
                style: TextStyle(
                    fontSize: TSizes.fontSizeLg, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Zone',
                    style: TextStyle(
                        fontSize: TSizes.fontSizeMd,
                        fontWeight: FontWeight.bold),
                  ),
                  ZonesDropdown(),
                ],
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date",
                    style: TextStyle(
                        fontSize: TSizes.fontSizeMd,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    width: 70.w,
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${selectedDate.toLocal()}".split(' ')[0],
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: () => _selectDate(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: TSizes.spaceBtwSections),
              const Divider(height: 0, color: TColors.gray),
              SizedBox(height: TSizes.spaceBtwItems),
              Text(
                "Pick Staff",
                style: TextStyle(
                    fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: const Image(
                      image: NetworkImage('https://picsum.photos/200/200'),
                    ),
                  ),
                  SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Staff Name",
                        style: TextStyle(
                            fontSize: TSizes.fontSizeMd,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      RatingStars(
                        rating: 4,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const Divider(height: 0, color: TColors.gray),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                "Time Slot",
                style: TextStyle(
                    fontSize: TSizes.fontSizeMd, fontWeight: FontWeight.bold),
              ),
              TimeSlotsList(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              const Divider(height: 0, color: TColors.gray),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TButton(
                text: 'Book Now',
                onPressed: () => _showAlertDialog(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ZonesDropdown extends StatefulWidget {
  ZonesDropdown({super.key});

  @override
  State<ZonesDropdown> createState() => _ZonesDropdownState();
}

class _ZonesDropdownState extends State<ZonesDropdown> {
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];

  String dropdownValue = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dropdownValue = list.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<String>(
      width: 70.w,
      initialSelection: list.first,
      onSelected: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}

class TimeSlotsList extends StatefulWidget {
  @override
  _TimeSlotsListState createState() => _TimeSlotsListState();
}

class _TimeSlotsListState extends State<TimeSlotsList> {
  int? _selectedValue;
  List<String> _options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _options.length,
      itemBuilder: (BuildContext context, int index) {
        return RadioListTile<int>(
          title: Text(_options[index]),
          value: index,
          groupValue: _selectedValue,
          onChanged: (int? value) {
            setState(() {
              _selectedValue = value;
            });
          },
        );
      },
    );
  }
}
