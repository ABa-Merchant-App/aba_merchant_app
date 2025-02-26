import 'dart:async';
import 'package:flutter/material.dart';
import 'package:merchant_app/features/authentication/presentation/pages/login_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const  LoginScreen()),
      );
    });
    return Scaffold(
      body: Container(
        decoration: const  BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ic_launcher.png'), // Your background image
            fit: BoxFit.cover, // Cover the entire screen
          ),
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              Text(
                'Amhara Bank',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              SizedBox(height: 20),
              Text(
                'Loading...',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}