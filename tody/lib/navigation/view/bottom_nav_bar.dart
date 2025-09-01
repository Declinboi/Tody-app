import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import 'package:app_ui/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tody/home/home.dart';
import 'package:tody/l10n/l10n.dart';
import 'package:shared/shared.dart';

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




















// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final homeProvider = context.read<HomeProvider>();
//     final items = mainNavigationBarItems(
//       homeLabel: 'Home',
//       searchLabel: 'Search',
//       createMediaLabel: 'Create',
//       reelsLabel: 'Reels',
//       userProfileLabel: 'Profile',
//     );

//     return ChangeNotifierProvider.value(
//       value: homeProvider,
//       child: Consumer<HomeProvider>(
//         builder: (context, provider, _) {
//           return Scaffold(
//             body: PageView(
//               controller: provider.pageController,
//               physics: provider.enablePageView
//                   ? const BouncingScrollPhysics()
//                   : const NeverScrollableScrollPhysics(),
//               onPageChanged: (index) {
//                 // no notify needed here, BottomNavigationBar will handle
//               },
//               children: const [
//                 Center(child: Text('Home Page')),
//                 Center(child: Text('Search Page')),
//                 Center(child: Text('Create Page')),
//                 Center(child: Text('Reels Page')),
//                 Center(child: Text('Profile Page')),
//               ],
//             ),
//             bottomNavigationBar: ValueListenableBuilder(
//               valueListenable: provider.pageController,
//               builder: (context, PageController controller, _) {
//                 final currentIndex = controller.hasClients
//                     ? controller.page?.round() ?? 0
//                     : 0;

//                 return BottomNavigationBar(
//                   currentIndex: currentIndex,
//                   onTap: provider.animateToPage,
//                   type: BottomNavigationBarType.fixed,
//                   items: items
//                       .map(
//                         (item) => BottomNavigationBarItem(
//                           icon: item.icon != null
//                               ? Icon(item.icon)
//                               : item.child!,
//                           label: item.label,
//                         ),
//                       )
//                       .toList(),
//                 );
//               },
//             ),
//           );
//         },
//       ),
//     );
//   }
// }












// // import 'package:clone/app/bloc/app_bloc.dart';
// // import 'package:clone/feed/feed.dart';
// // import 'package:clone/feed/post/video/video.dart';
// // import 'package:instagram_blocks_ui/instagram_blocks_ui.dart';

// /// {@template main_bottom_navigation_bar}
// /// Bottom navigation bar of the application. It contains the [navigationShell]
// /// that will handle the navigation between the different bottom navigation
// /// bars.
// /// {@endtemplate}
// class BottomNavBar extends StatelessWidget {
//   /// {@macro bottom_nav_bar}
//   const BottomNavBar({
//     required this.navigationShell,
//     super.key,
//   });

//   /// Navigation shell that will handle the navigation between the different
//   /// bottom navigation bars.
//   final StatefulNavigationShell navigationShell;

//   @override
//   Widget build(BuildContext context) {
//     // final videoPlayer = VideoPlayerInheritedWidget.of(context);

//     // final user = context.select((AppBloc bloc) => bloc.state.user);

//     final navigationBarItems = mainNavigationBarItems(
//       homeLabel: context.l10n.homeNavBarItemLabel,
//       searchLabel: context.l10n.searchNavBarItemLabel,
//       createMediaLabel: context.l10n.createMediaNavBarItemLabel,
//       reelsLabel: context.l10n.reelsNavBarItemLabel,
//       userProfileLabel: context.l10n.profileNavBarItemLabel,
//       // userProfileAvatar: AnimatedCrossFade(
//       //   firstChild: const Icon(Icons.person),
//       //   // secondChild: UserProfileAvatar(
//       //   //   avatarUrl: user.avatarUrl,
//       //   //   isLarge: false,
//       //   //   radius: 18,
//       //   // ),
//       //   // crossFadeState:
//       //   //     user.avatarUrl == null || (user.avatarUrl?.isEmpty ?? true)
//       //   //         ? CrossFadeState.showFirst
//       //   //         : CrossFadeState.showSecond,
//       //   duration: 350.ms,
//       // ),
//     );

//     return BottomNavigationBar(
//       currentIndex: navigationShell.currentIndex,
//       onTap: (index) {
//         HomeProvider().togglePageView(enable: index == 0);
//         if ([0, 1, 2, 3].contains(index)) {
//           if (index case 0) videoPlayer.videoPlayerState.playFeed();
//           if (index case 1) videoPlayer.videoPlayerState.playTimeline();
//           if (index case 2) {
//             HomeProvider().animateToPage(0);
//             HomeProvider().togglePageView();
//           }
//           if (index case 3) videoPlayer.videoPlayerState.playReels();
//         } else {
//           videoPlayer.videoPlayerState.stopAll();
//         }
//         if (index != 2) {
//           navigationShell.goBranch(
//             index,
//             initialLocation: index == navigationShell.currentIndex,
//           );
//         }
//         if (index == 0) {
//           if (!(index == navigationShell.currentIndex)) return;
//           // FeedPageController().scrollToTop();
//         }
//       },
//       iconSize: 28,
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       items: navigationBarItems
//           .map(
//             (e) => BottomNavigationBarItem(
//               icon: e.child ?? Icon(e.icon),
//               label: e.label,
//               tooltip: e.tooltip,
//             ),
//           )
//           .toList(),
//     );
//   }
// }
