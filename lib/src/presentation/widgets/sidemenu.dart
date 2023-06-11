import 'package:flutter/material.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        width: width * 0.47,
        backgroundColor: Colors.white70.withOpacity(0.8),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: ListView(
            children: [
              Text(
                'F R E S H   &  G O',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    height: 1,
                    color: Colors.green.withOpacity(0.9),
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  thickness: height * 0.005,
                  color: Colors.green.withOpacity(0.9),
                ),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              Text(
                'F R E S H  J U I C E',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    height: 1,
                    color: Colors.green.withOpacity(0.9),
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: height * 0.07,
              ),
              Text(
                'S M O O T H I E',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    height: 1,
                    color: Colors.green.withOpacity(0.9),
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
