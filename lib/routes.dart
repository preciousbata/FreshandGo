import 'package:flutter/material.dart';
import 'package:restaurant_app/src/presentation/screen/homescreen.dart';
import 'package:restaurant_app/src/presentation/screen/shopping_cart_screen.dart';
import 'package:restaurant_app/src/presentation/screen/splashscreen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ShoppingCartScreen.routeName: (context) => const ShoppingCartScreen(),
};
