import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:tody/auth/signup/signup_page.dart';

class EmailPage extends StatelessWidget {
  const EmailPage({required this.onContinueWithSignup, super.key});
  final VoidCallback onContinueWithSignup;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.white,
      body: AppConstrainedScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: SizeConfig.responsiveSize(20)),

            // Title
            Center(
              child: Column(
                children: [
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: SizeConfig.responsiveSize(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(height: 16),
                  Text(
                    'Your work faster and structured with Todyapp',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: SizeConfig.responsiveSize(14),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: SizeConfig.responsiveSize(40)),

            // Label
            Text(
              'Email Address',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: SizeConfig.responsiveSize(17),
              ),
            ),

            SizedBox(height: SizeConfig.responsiveSize(8)),

            // Input
            TextField(
              style: TextStyle(
                color: AppColors.black, // ✅ this controls typed text color
                fontSize: SizeConfig.responsiveSize(15),
              ),
              decoration: InputDecoration(
                hintText: 'name@example.com',
                hintStyle: const TextStyle(color: AppColors.grey),
                filled: true,
                fillColor: AppColors.shadeGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            const Spacer(),

            // Button
            SizedBox(
              width: double.infinity,
              height: SizeConfig.responsiveSize(56),
              child: AppButton.primary(
                text: 'Next',
                onPressed: onContinueWithSignup,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
