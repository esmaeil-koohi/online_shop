import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shope_bloc/features/feature_intro/presentation/screens/intro_screen.dart';
import 'package:shope_bloc/features/feature_intro/presentation/screens/splash_screen.dart';
import 'features/feature_intro/presentation/bloc/splash_cubit/splash_cubit.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
    BlocProvider(create: (context) => SplashCubit(),),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        IntroScreen.routeName : (context)=> IntroScreen(),
      },
      debugShowCheckedModeBanner: false,
      title: 'besenior shop',
      home: SplashScreen(),
    );
  }
}

