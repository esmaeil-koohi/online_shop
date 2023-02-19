import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shope_bloc/common/utils/custom_snackbar.dart';
import 'package:shope_bloc/features/feature_intro/presentation/bloc/splash_cubit/splash_cubit.dart';
import 'package:shope_bloc/features/feature_intro/presentation/screens/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashCubit>(context).checkConnectionEvent();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: DelayedWidget(
              delayDuration: const Duration(milliseconds: 200),
              animationDuration: const Duration(milliseconds: 1000),
              child: Icon(
                Icons.storefront,
                size: width * 0.8,
                color: Colors.blue,
              ),
            )),
            BlocConsumer<SplashCubit, SplashState>(
              builder: (context, state) {
                if (state.connectionStatus is ConnectionInitial ||state.connectionStatus is ConnectionOn) {
                  return Directionality(
                      textDirection: TextDirection.ltr,
                      child: LoadingAnimationWidget.prograssiveDots(
                          color: Colors.red, size: 50));
                }

                if(state.connectionStatus is ConnectionOff){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('! به اینترنت متصل نیستید', style: TextStyle(color: Colors.red),),
                      IconButton(onPressed: () {
                        BlocProvider.of<SplashCubit>(context).checkConnectionEvent();
                      }, icon: const Icon(Icons.autorenew, color: Colors.red,))
                    ],
                  );
                }
                return Container();
              },

              listener: (context, state) {
                if (state.connectionStatus is ConnectionOn) {
                  gotoHome();
                }
              },
            ),
            const Text(
              '! به اینترنت متصل هستید',
              style: TextStyle(
                  color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> gotoHome() {
    return Future.delayed(
      const Duration(seconds: 3),
      () {
        CustomSnackBar.showSnack(context, 'شما وارد شدید', Colors.green);
        Navigator.pushNamed(context, IntroScreen.routeName, arguments: 'beSenior');
      },
    );
  }
}
