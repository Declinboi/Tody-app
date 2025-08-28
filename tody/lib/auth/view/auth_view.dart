import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:tody/app/home/view/theme_view.dart';
import 'package:tody/auth/auth.dart';
// import 'package:tody/auth/onboarding/welcome_page.dart';
// import 'package:tody/auth/signup/email_page.dart';
// import 'package:tody/auth/signup/signup_page.dart';

class SwipeScreens extends StatelessWidget {
  // <-- add this
  const SwipeScreens({required this.onContinueWithThird, super.key});
  final VoidCallback onContinueWithThird;

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        const Firstscreen(),
        Secondscreen(onContinueWithThird: onContinueWithThird),
      ],
    );
  }
}

enum AuthView { login, third, welcome, email, signup, theme }

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  AuthView currentView = AuthView.login;
  void toggleTo(AuthView view) => setState(() => currentView = view);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: currentView == AuthView.login,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop) {
          setState(() {
            // step back one screen
            switch (currentView) {
              case AuthView.third:
                currentView = AuthView.login;
              case AuthView.welcome:
                currentView = AuthView.third;
              case AuthView.email:
                currentView = AuthView.welcome;
              case AuthView.signup:
                currentView = AuthView.email;
              default:
                break;
            }
          });
        }
      },
      child: PageTransitionSwitcher(
        reverse: currentView == AuthView.login,
        transitionBuilder: (child, animation, secondaryAnimation) {
          return SharedAxisTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
            child: child,
          );
        },
        child: _buildCurrentView(),
      ),
    );
  }

  Widget _buildCurrentView() {
    switch (currentView) {
      case AuthView.login:
        return SwipeScreens(
          onContinueWithThird: () => toggleTo(AuthView.third),
        );
      case AuthView.third:
        return Thirdscreen(
          onContinueWithWelcome: () => toggleTo(AuthView.welcome),
        );
      case AuthView.welcome:
        return WelcomePage(
          onContinueWithEmail: () => toggleTo(AuthView.email),
        );
      case AuthView.email:
        return EmailPage(
          onContinueWithSignup: () => toggleTo(AuthView.signup),
        );
      case AuthView.signup:
        return SignupPage(onContinueWithTheme: () => toggleTo(AuthView.theme));
      case AuthView.theme:
        return const ThemeScreen();
    }
  }
}
