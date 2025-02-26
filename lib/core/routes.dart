import 'package:flutter/material.dart';
import 'package:merchant_app/features/authentication/presentation/pages/login_screen.dart';
import 'package:merchant_app/features/authentication/presentation/pages/splash_screen.dart';
import 'package:merchant_app/features/menu/presentation/pages/menu_screen.dart';
import 'package:merchant_app/features/product_list/presentation/pages/product_list_screen.dart';
import 'package:merchant_app/features/product_list/presentation/pages/qr_generation.dart';

class AppRoutes{
  static const String loginScreen='/login_screen';
  static const String productList='/product_list';
  static const String qrGeneration='/qr_generation';
  static const String flash='/flash';
  static const String changePassword='/change_password';
  static Map<String,WidgetBuilder> routes={
   loginScreen:(context)=> const LoginScreen(),
   productList:(context)=>  ProductListScreen(),
   qrGeneration:(context)=>const QrGeneration(),
   flash:(context)=> SplashScreen(),
   changePassword:(context)=> const MenuScreen(),
  };
}