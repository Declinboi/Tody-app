import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:app_ui/app_ui.dart';
// import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tody/home/home.dart';
// import 'package:tody/l10n/l10n.dart';
// import 'package:shared/shared.dart';

// import 'home_provider.dart';
// import 'nav_items.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    final provider = context.read<HomeProvider>();

    final navigationBarItems = mainNavigationBarItems(
      homeLabel: 'Home',
      searchLabel: 'Search',
      createMediaLabel: 'Create',
      reelsLabel: 'Reels',
      userProfileLabel: 'Profile',
    );

    return BottomNavigationBar(
      currentIndex: navigationShell.currentIndex,
      onTap: (index) {
        // toggle PageView on/off depending on tab
        provider.togglePageView(enable: index == 0);

        // // handle custom behavior per tab
        // switch (index) {
        //   case 0:
        //     // feed logic here
        //     break;
        //   case 1:
        //     // search logic here
        //     break;
        //   case 2:
        //     // “create” gets special handling
        //     provider.animateToPage(0);
        //     provider.togglePageView();
        //     break;
        //   case 3:
        //     // reels logic here
        //     break;
        //   default:
        //     // profile logic here
        //     break;
        // }

        // make sure navigation shell switches
        if (index != 2) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        }

        // optional “scroll to top” if user re-taps Home
        if (index == 0 && index == navigationShell.currentIndex) {
          // FeedPageController().scrollToTop();
        }
      },
      iconSize: 28,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      items: navigationBarItems
          .map(
            (e) => BottomNavigationBarItem(
              icon: e.child ?? Icon(e.icon),
              label: e.label,
              tooltip: e.tooltip,
            ),
          )
          .toList(),
    );
  }
}
