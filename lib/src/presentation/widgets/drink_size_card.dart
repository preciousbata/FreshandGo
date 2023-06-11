import 'package:flutter/material.dart';

class DrinkSizeCard extends StatelessWidget {
  const DrinkSizeCard({
    super.key,
    required this.width,
    required this.height,
    required this.imageUrl,
    required this.size,
    required this.color,
    this.fontWeight = FontWeight.bold,
    this.fontColor = Colors.black,
  });

  final double width;
  final double height;
  final String imageUrl;
  final String size;
  final Color color;
  final FontWeight fontWeight;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height), color: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(imageUrl),
          Text(
            size,
            style: TextStyle(fontWeight: fontWeight, color: fontColor),
          )
        ],
      ),
    );
  }
}
