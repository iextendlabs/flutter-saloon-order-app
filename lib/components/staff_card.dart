import 'package:flutter/material.dart';
import 'package:saloon/config/api_urls.dart';
import 'package:saloon/models/RatingStars.dart';
import 'dart:convert';

class Staff {
  final String imageUrl; // Changed from image to imageUrl
  final String name;
  final double rating;
  final String charges;
  final String subTitle;

  Staff({
    required this.imageUrl, // Changed from image to imageUrl
    required this.name,
    required this.rating,
    required this.charges,
    required this.subTitle,
  });

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      imageUrl: json['staff']['image'] ?? "", // Updated imageUrl property
      name: json['name'] ?? "",
      rating: json['staff']['rating'] != null ? double.parse(json['staff']['rating']) : 0.0,
      charges: json['staff']['charges'] ?? "",
      subTitle: json['staff']['sub_title'] ?? "",
    );
  }
}

class StaffCard extends StatelessWidget {
  final Staff staff;

  StaffCard({required this.staff});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            width: 130.0,
            height: 130.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(ApiUrls.baseUrl+'staff-images/' + staff.imageUrl), // Use NetworkImage for network URLs
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            staff.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            staff.subTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            staff.charges.isNotEmpty && staff.charges != '0' ? 'Extra Charges: AED${staff.charges}' : '',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          SizedBox(height: 4.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RatingStars(rating: staff.rating), // Use RatingStars component here
              SizedBox(width: 4.0),
            ],
          ),
        ],
      ),
    );
  }
}
