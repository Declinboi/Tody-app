import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class Secondscreen extends StatelessWidget {
  const Secondscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingScreen();
  }
}

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

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

            Stack(
              alignment: Alignment.topCenter,
              children: [
                /// The image
                Assets.images.secondScreen.image(
                  height: 452.98,
                  width: 375,
                  fit: BoxFit.cover,
                ),

                /// Text placed on top of the image
                const Positioned(
                  bottom: 25, // 👈 move upward/downward by adjusting this value
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Your convenience in\nmaking a todo list',
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
                ),
              ],
            ),

            const SizedBox(height: 12),
            const Text(
              'Here’s a mobile platform that helps you create task\nor to do list '
              'so that it can help you in every job\neasier and faster.',
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
                _buildDot(true),
                _buildDot(false),
              ],
            ),

            const SizedBox(height: 24),
            const SizedBox(height: 24),
            const SizedBox(height: 24 * 2),

            /// Continue button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: AppButton.primary(
                text: 'Continue',
                onPressed: () {
                  // your action
                },
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
