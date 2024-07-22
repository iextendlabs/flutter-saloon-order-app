import 'package:flutter/material.dart';

import '../../common/widgets/notification_item.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/constants/text_strings.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(TTexts.appBarNotificationScreenTitle),
        backgroundColor: TColors.primary,
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: 3,
          itemBuilder: (context, index) {
            return Column(
              children: [
                NotificationItem(
                   text:  'New Voucher',
                    onPressed: () {}),
                const Divider(height: 0, color: TColors.gray),
              ],
            );
          },
        )
      ),
    );
  }
}
