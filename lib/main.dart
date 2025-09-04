import 'package:flutter/material.dart' hide SearchController;
import 'package:provider/provider.dart';

// Core
import 'package:restaurant/core/app_router.dart';

// Profile Feature
import 'package:restaurant/profile/control/profile_controller.dart';
import 'package:restaurant/profile/data/repo/profile_repository.dart';
import 'package:restaurant/profile/data/sources/profile_remote_source.dart';

// Search Feature
import 'package:restaurant/search/control/search_controller.dart';
import 'package:restaurant/search/data/repo/search_repository.dart';
import 'package:restaurant/search/data/sources/search_remote_source.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProfileController(
            ProfileRepository(ProfileRemoteSource()),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => SearchController(
            SearchRepository(SearchRemoteSource()),
          )..loadItems(), // تحميل البيانات عند بداية التشغيل
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: '/splash', // البداية من شاشة Splash
    );
  }
}
