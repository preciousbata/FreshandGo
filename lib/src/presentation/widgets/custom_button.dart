import 'package:flutter/material.dart';
import 'package:restaurant_app/src/core/contants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.height,
    required this.width,
    required this.text,
    required this.icon,
    this.size = 12,
  });

  final double height;
  final double width;
  final double size;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height * 0.2),
          color: PRIMARY_COLOR),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 23, color: WHITE, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: width * 0.14,
          ),
          Icon(
            icon,
            size: size,
            color: WHITE,
          ),
        ],
      ),
    );
  }
}
