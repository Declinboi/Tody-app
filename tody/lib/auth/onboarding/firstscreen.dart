import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class Firstscreen extends StatelessWidget {
  const Firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreen();
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: SafeArea(
        top: true,
        child: AppConstrainedScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Assets.images.frontLogo.image(
                  width: SizeConfig.responsiveSize(76),
                  height: SizeConfig.responsiveSize(76),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Todyapp',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: SizeConfig.responsiveSize(26),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'The best to do list application for you',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: SizeConfig.responsiveSize(14),
                ),
              ),
              const SizedBox(height: 50),
              const PageIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

//
class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 8,
          width: 20,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        const SizedBox(width: 6),
        Container(
          height: 8,
          width: 8,
          decoration: const BoxDecoration(
            color: Colors.white38,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 6),
        Container(
          height: 8,
          width: 8,
          decoration: const BoxDecoration(
            color: Colors.white38,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
