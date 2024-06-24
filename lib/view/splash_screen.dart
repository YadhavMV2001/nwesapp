import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nwesapp/controller/splash_controller.dart';
import 'package:nwesapp/utils/text_theme.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final splashScreenProvider = Provider.of<SplashScreenProvider>(context);

    Future.delayed(Duration(seconds: 5), () {
      splashScreenProvider.setLoading(false);
    });
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "News Today",
              style: NewsText.textMain,
            ),
            if (splashScreenProvider.isLoading)
              LottieBuilder.asset(
                "assets/animations/Animation - 1718790816466.json",
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              )
          ],
        ),
      ),
    );
  }
}
