import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tody/app/app.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _TodoThemeScreenState();
}

class _TodoThemeScreenState extends State<ThemeScreen> {
  int selectedIndex = 0; // keeps track of selected theme

  final List<Color> themeColors = [
    Colors.teal,
    Colors.black,
    Colors.red,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: Colors.white,
      body: AppConstrainedScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Text(
              'Create to do list',
              style: TextStyle(
                fontSize: SizeConfig.responsiveSize(28),
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Choose your to do list color theme:',
              style: TextStyle(
                fontSize: SizeConfig.responsiveSize(14),
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),

            // Theme list container
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(themeColors.length, (index) {
                return Tappable.scaled(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: _buildThemeItem(
                    themeColors[index],
                    isSelected: selectedIndex == index,
                  ),
                );
              }),
            ),

            const Spacer(),

            // Button
            SizedBox(
              width: double.infinity,
              height: SizeConfig.responsiveSize(56),
              child: AppButton.primary(
                text: 'Open Todyapp',
                onPressed: () {
                  context.go(
                    AppRoutes.feed.route,
                  ); // Navigate to the next screen or perform an action
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeItem(Color headerColor, {bool isSelected = false}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                height: SizeConfig.responsiveSize(26),
                decoration: BoxDecoration(
                  color: headerColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
              ),
              ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 18,
                ),
                title: Container(
                  height: 10,
                  width: 80,
                  color: Colors.grey[300],
                  margin: const EdgeInsets.symmetric(vertical: 4),
                ),
                subtitle: Container(
                  height: 10,
                  width: 120,
                  color: Colors.grey[300],
                  margin: const EdgeInsets.symmetric(vertical: 4),
                ),
              ),
            ],
          ),
        ),

        if (isSelected)
          Positioned(
            top: -10,
            left: -4,
            child: CircleAvatar(
              radius: 14,
              backgroundColor: headerColor,
              child: const Icon(Icons.check, size: 16, color: Colors.white),
            ),
          ),
      ],
    );
  }
}
