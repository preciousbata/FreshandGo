import 'package:flutter/material.dart';
import 'package:restaurant_app/src/core/contants.dart';
import 'package:restaurant_app/src/presentation/screen/homescreen.dart';
import 'package:restaurant_app/src/presentation/widgets/custom_button.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        '${GOOGLE_DRIVE_PREFIX}1jp-Ag-8RVgpOPYqJf44QqfLhVPO9esmG'),
                    opacity: 0.72,
                    fit: BoxFit.cover)),
          ),
          Positioned(
            top: height * 0.70,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Text(
                'F R E S H & G O',
                style: TextStyle(
                    fontSize: 30,
                    height: 1,
                    color: Colors.green.withOpacity(0.9),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: height * 0.80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'We Provide a Variety of Natural Fresh \nJuice and Smoothies',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    height: 1,
                    letterSpacing: 1.2,
                    color: Colors.green.withOpacity(0.9),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: height * 0.05),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () => Navigator.pushReplacementNamed(
                      context, HomeScreen.routeName),
                  child: CustomButton(
                    height: height,
                    width: width,
                    size: width * 0.09,
                    icon: Icons.chevron_right,
                    text: 'W E L C O M E',
                  ),
                )),
          )
        ],
      ),
    );
  }
}
