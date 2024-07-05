import 'package:flutter/material.dart';

class WishlistButton extends StatefulWidget {
  const WishlistButton({super.key});

  @override
  State<WishlistButton> createState() => _WishlistButtonState();
}

class _WishlistButtonState extends State<WishlistButton> {

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
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          Icons.favorite,// : Icons.favorite_border,
          color: Colors.red,
          size: 26,
        ),
      ),
    );
  }
}
