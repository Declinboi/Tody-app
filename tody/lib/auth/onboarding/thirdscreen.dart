import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
// import 'package:tody/auth/signup/email_page.dart';
// import 'package:tody/auth/onboarding/welcome_page.dart';

class Thirdscreen extends StatelessWidget {
  const Thirdscreen({required this.onContinueWithWelcome, super.key});
  final VoidCallback onContinueWithWelcome;

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen2(onContinueWithWelcome: onContinueWithWelcome);
  }
}

class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({required this.onContinueWithWelcome, super.key});
  final VoidCallback onContinueWithWelcome;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      // top: true,
      backgroundColor: AppColors.white,
      body: AppConstrainedScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        child: Column(
          children: [
            /// Skip button
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            /// The image
            Assets.images.thirdScreen.image(
              height: 360.98,
              width: 375,
              fit: BoxFit.cover,
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Find the practicality in\nmaking your todo list',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Easy-to-understand user interface that makes you\nmore comfortable when you want to create a task or\nto do list, Todyapp can also improve productivity',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
                height: 1.5,
              ),
            ),

            const SizedBox(height: 35),

            /// Page indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(false),
                _buildDot(false),
                _buildDot(true),
              ],
            ),

            const Spacer(),

            /// Continue button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: AppButton.primary(
                text: 'Continue',
                onPressed: onContinueWithWelcome,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 20 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.teal : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
