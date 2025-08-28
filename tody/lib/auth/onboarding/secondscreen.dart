import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
// import 'package:tody/auth/onboarding/thirdscreen.dart';

class Secondscreen extends StatelessWidget {
  const Secondscreen({
    required this.onContinueWithThird,
    super.key, // 👈 add this, super.key,
  });

  final VoidCallback onContinueWithThird;

  @override
  Widget build(BuildContext context) {
    return OnboardingScreen(
      onContinueWithThird: onContinueWithThird, // 👈 forward it
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({required this.onContinueWithThird, super.key});
  final VoidCallback onContinueWithThird;
  @override
  Widget build(BuildContext context) {
    // SizeConfig.init();
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

            SizedBox(height: SizeConfig.responsiveSize(24)),

            Stack(
              alignment: Alignment.topCenter,
              children: [
                /// The image
                Assets.images.secondScreen.image(
                  height: SizeConfig.responsiveSize(453), // instead of 452.98
                  width: SizeConfig.responsiveSize(375),
                  fit: BoxFit.cover,
                ),

                /// Text placed on top of the image
                Positioned(
                  bottom: 25, // 👈 move upward/downward by adjusting this value
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Your convenience in\nmaking a todo list',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: SizeConfig.responsiveSize(24),
                            fontWeight: FontWeight.bold,
                            color: AppColors.black,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // SizedBox(height: SizeConfig.responsiveSize(4)),
            Text(
              'Here’s a mobile platform that helps you create task\nor to do list'
              'so that it can help you in every job\neasier and faster.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: SizeConfig.responsiveSize(12),
                color: Colors.grey,
                height: 1.5,
              ),
            ),

            SizedBox(height: SizeConfig.responsiveSize(35)),

            /// Page indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDot(false),
                _buildDot(true),
                _buildDot(false),
              ],
            ),

            const Spacer(),

            /// Continue button
            SizedBox(
              width: double.infinity,
              height: SizeConfig.responsiveSize(56),
              child: AppButton.primary(
                text: 'Continue',
                onPressed: onContinueWithThird,
              ),
            ),
            SizedBox(height: SizeConfig.responsiveSize(25)),
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
