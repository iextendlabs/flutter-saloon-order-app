import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controllers/auth_controllers/sign_up_controller.dart';
import '../../utils/constants/colors.dart';

class CountryCodeSelector extends StatelessWidget {
   const CountryCodeSelector({
    super.key,
    required this.formController, this.icon = Icons.call, required this.countryCode,
  });

  final SignUpController formController;
  final IconData icon;
  final Rxn<CountryCode> countryCode;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          formController.pickCountryCode(context,countryCode),
      child: SizedBox(
        width: 160,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            Icon(icon, color: TColors.black),
            const SizedBox(width: 10),
            Obx(() {
              if (countryCode.value != null) {
                return Row(
                  children: [
                    Image.asset(
                      countryCode.value!.flagUri,
                      width: 30.0,
                      height: 22,
                      fit: BoxFit.cover,
                      package: countryCode.value!.flagImagePackage,
                    ),
                    const SizedBox(width: 10),
                    Text(countryCode.value!.dialCode),
                  ],
                );
              } else {
                return const Text('Country');
              }
            }),
            const SizedBox(width: 2),
            const Icon(Icons.arrow_drop_down, color:TColors.black),
          ],
        ),
      ),
    );
  }
}
