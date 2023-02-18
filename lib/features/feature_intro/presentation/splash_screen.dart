import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);


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
                child:
            ),
             const Text('! به اینترنت متصل هستید', style: TextStyle(color: Colors.red, fontSize: 15, fontWeight: FontWeight.bold),),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
