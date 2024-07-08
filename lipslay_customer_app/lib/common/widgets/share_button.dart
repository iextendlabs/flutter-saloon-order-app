import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class ShareButton extends StatefulWidget {
  const ShareButton({super.key});

  @override
  State<ShareButton> createState() => _ShareButtonState();
}

class _ShareButtonState extends State<ShareButton> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {

      },
      child: Container(
        width: 35,
        height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: const Icon(
          Icons.share,// : Icons.favorite_border,
          color: TColors.black,
          size: 22,
        ),
      ),
    );
  }
}
