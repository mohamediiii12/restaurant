import 'package:flutter/material.dart';

// Splash & Onboarding

import 'package:restaurant/onboarding/view/onboarding_screen.dart';

// Login Feature
import 'package:restaurant/login feature/view/login_screen.dart';

// Home Feature
import 'package:restaurant/home feature/view/home_screen.dart';
import 'package:restaurant/onboarding/view/splash_screen.dart';

// Profile Feature
import 'package:restaurant/profile/view/profile_screen.dart';

// Search Feature
import 'package:restaurant/search/view/search_screen.dart';


class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case '/onboarding':
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      case '/login':
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      case '/search':
        return MaterialPageRoute(builder: (_) => SearchScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text("Page not found")),
          ),
        );
    }
  }
}
