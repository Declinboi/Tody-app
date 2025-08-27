import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:tody/auth/widgets/password_field.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: AppColors.white,
      body: AppConstrainedScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Title
            const Center(
              child: Column(
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // SizedBox(height: 16),
                  Text(
                    'Create your account and feel the benefits',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // Label
            const Text(
              'Username',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
            const SizedBox(height: 8),

            // Input
            TextField(
              style: const TextStyle(
                color: AppColors.black, // ✅ this controls typed text color
                fontSize: 15,
              ),
              decoration: InputDecoration(
                hintText: 'Enter your username',
                hintStyle: const TextStyle(color: AppColors.grey),
                filled: true,
                fillColor: AppColors.shadeGrey,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
              keyboardType: TextInputType.text,
            ),

            const SizedBox(height: 30),

            // Label
            const Text(
              'Password',
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),

            const SizedBox(height: 8),

            PasswordField(
              onChanged: (value) {
                print('Password: $value');
              },
            ),

            const Spacer(),

            // Button
            SizedBox(
              width: double.infinity,
              height: 56,
              child: AppButton.primary(
                text: 'Sign Up',
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
}
