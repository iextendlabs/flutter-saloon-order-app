import 'package:flutter/material.dart';

import '../../models/staff.dart';
import '../../utils/constants/sizes.dart';
import '../widgets/staff_item.dart';

class StaffList extends StatelessWidget {
  const StaffList({
    super.key,
    required this.staffList,
  });

  final List<Staff> staffList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: staffList.length,
        padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
        itemBuilder: (context, index) {
          return StaffItem(staff: staffList[index]);
        },
      ),
    );
  }
}
