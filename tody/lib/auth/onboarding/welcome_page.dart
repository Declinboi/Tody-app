import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({required this.onContinueWithEmail, super.key});
  final VoidCallback onContinueWithEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: SizeConfig.responsiveSize(40)),

              // Title
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: SizeConfig.responsiveSize(28),
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                  children: const [
                    TextSpan(text: 'Welcome to '),
                    TextSpan(
                      text: 'Todyapp',
                      style: TextStyle(color: AppColors.green),
                    ),
                  ],
                ),
              ),

              SizedBox(height: SizeConfig.responsiveSize(30 * 2)),

              // Illustration image
              Assets.images.welcomeScreen.image(
                height: SizeConfig.responsiveSize(453),
                width: SizeConfig.responsiveSize(375),
                fit: BoxFit.cover,
              ),
              const Spacer(),

              // Continue with email button
              SizedBox(
                width: double.infinity,
                height: SizeConfig.responsiveSize(56),

                child: AppButton.primary(
                  icon: const Icon(Icons.email, color: AppColors.white),
                  text: 'Continue with email',
                  onPressed: onContinueWithEmail,
                ),
              ),

              SizedBox(height: SizeConfig.responsiveSize(16)),

              // Or continue with
              const Row(
                children: [
                  Expanded(
                    child: AppDivider(color: AppColors.emphasizeGrey),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'or continue with',
                      style: TextStyle(color: AppColors.emphasizeGrey),
                    ),
                  ),
                  Expanded(
                    child: AppDivider(
                      color: AppColors.emphasizeGrey,
                    ),
                  ),
                ],
              ),

              SizedBox(height: SizeConfig.responsiveSize(16)),

              // Social buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _socialButton(
                    'Facebook',
                    Assets.icons.facebook,
                  ),
                  const SizedBox(width: 16),
                  _socialButton(
                    'Google',
                    Assets.icons.google,
                  ),
                ],
              ),
              SizedBox(height: SizeConfig.responsiveSize(30)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialButton(
    String text,
    SvgGenImage asset,
  ) {
    return Expanded(
      child: Tappable.faded(
        backgroundColor: AppColors.shadeGrey,
        borderRadius: BorderRadius.circular(16),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        onTap: () {
          // handle tap
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            asset.svg(width: 20, height: 20),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
