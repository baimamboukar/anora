import 'package:anora/app/router/router.gr.dart' as routes;
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: const [
        routes.HomeRoute(),
        routes.ChatRoute(),
        routes.ProfileRoute(),
      ],
      transitionBuilder: (context, child, animation) => ScaleTransition(
        scale: animation,
        child: child,
      ),
      bottomNavigationBuilder: (context, router) => NavigationBar(
        selectedIndex: router.activeIndex,
        onDestinationSelected: (index) {
          router.setActiveIndex(index);
        },
        destinations: const [
          NavigationDestination(
            icon: HeroIcon(HeroIcons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: HeroIcon(HeroIcons.sparkles),
            label: 'Anora',
          ),
          NavigationDestination(
            icon: HeroIcon(HeroIcons.user),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
