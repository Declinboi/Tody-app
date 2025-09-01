// ignore_for_file: avoid_positional_boolean_parameters

import 'package:app_ui/app_ui.dart';
import 'package:tody/home/home.dart';
import 'package:tody/navigation/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared/shared.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return HomeView(navigationShell: navigationShell);
  }
}

class HomeView extends StatefulWidget {
  const HomeView({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('ScaffoldWithNavBar'));

  final StatefulNavigationShell navigationShell;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1)
      ..addListener(_onPageScroll);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      HomeProvider().setPageController(_pageController);
    });
  }

  void _onPageScroll() {
    _pageController.position.isScrollingNotifier.addListener(() {
      final isScrolling = _pageController.position.isScrollingNotifier.value;
      if (isScrolling) {
        debugPrint('Page is scrolling...');
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.navigationShell.currentIndex == 0 &&
        !HomeProvider().enablePageView) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        HomeProvider().togglePageView();
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavBar(
        navigationShell: widget.navigationShell,
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ListenableBuilder(
  //     listenable: HomeProvider(),
  //     builder: (context, child) {
  //       return PageView.builder(
  //         itemCount: 3,
  //         controller: _pageController,
  //         physics: HomeProvider().enablePageView
  //             ? null
  //             : const NeverScrollableScrollPhysics(),
  //         onPageChanged: (page) {
  //           if (page == 1 && widget.navigationShell.currentIndex != 0) {
  //             HomeProvider().togglePageView(enable: false);
  //           }
  //         },
  //         itemBuilder: (context, index) {
  //           return switch (index) {
  //             0 => const Center(child: Text('Create Post Page')),
  //             2 => const Center(child: Text('Chats Page')),
  //             _ => Scaffold(
  //                 body: widget.navigationShell,
  //                 bottomNavigationBar: BottomNavBar(
  //                   navigationShell: widget.navigationShell,
  //                 ),
  //               ),
  //           };
  //         },
  //       );
  //     },
  //   );
  // }
}
