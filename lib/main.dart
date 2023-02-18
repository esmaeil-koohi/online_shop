import 'package:flutter/material.dart';
import 'package:shope_bloc/features/feature_intro/presentation/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'besenior shop',
      home: SplashScreen(),
    );
  }
}

