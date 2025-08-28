// lib/splash/view/splash_screen.dart
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              SizedBox(
                width: 205,
                height: 258,
                child: Image.asset(
                  'assets/images/logo_restaurant.png',
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 30), 

              
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Arial',
                  ),
                  children: [
                    TextSpan(
                      text: 'YUM',
                      style: TextStyle(color: Colors.red),
                    ),
                    TextSpan(
                      text: 'QUICK',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
