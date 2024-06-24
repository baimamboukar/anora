import 'dart:ui';

import 'package:anora/app/features/auth/domain/auth_cubit/auth_cubit.dart';
import 'package:anora/app/router/router.gr.dart';
import 'package:anora/core/core.dart';
import 'package:anora/core/extensions/authx.dart';
import 'package:anora/src/app/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: this,
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final width = (context.width * 0.5) - 24;
    return Scaffold(
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          34.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    child: ShadImage(context.user!.photo),
                  ),
                  8.hGap,
                  Column(
                    children: [
                      Text(
                        'Hey ${context.user!.names} 👋',
                        style: context.title,
                      ),
                      Text('Welcome Back to Anora', style: context.desc),
                    ],
                  ),
                ],
              ),
              CircleAvatar(
                backgroundColor: context.colorScheme.primary,
                radius: 20,
                child: const HeroIcon(HeroIcons.bellAlert),
              ),
            ],
          ),
          24.vGap,
          const PaywallAction(),
          30.vGap,
          Row(
            children: [
              Container(
                width: width,
                height: 320,
                decoration: BoxDecoration(
                  color: context.colorScheme.selection,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Center(
                  child: GlassCircleBox(
                    icon: HeroIcon(HeroIcons.arrowDown),
                  ),
                ),
              ),
              10.hGap,
              Column(
                children: [
                  Container(
                    width: width,
                    height: 156,
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                  8.vGap,
                  Container(
                    width: width,
                    height: 156,
                    decoration: BoxDecoration(
                      color: context.colorScheme.destructive,
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ],
              ),
            ],
          ),
          10.vGap,
          Container(
            width: context.width,
            height: 120,
            decoration: BoxDecoration(
              color: context.colorScheme.foreground,
              borderRadius: BorderRadius.circular(18),
            ),
          ),
          // Text('Welcome to Anora, ${context.user!.names}'),
          // Text('Organization: ${context.orgs.first.name}'),
          // 24.vGap,
          // ShadButton(
          //   text: const Text('Singup from Invitation'),
          //   onPressed: () {
          //     final x = {
          //       'from':
          //           '{email: MS_RiPgsi@trial-yzkq340opj24d796.mlsender.net, name: Baimam Boukar}',
          //       'to': '{email: baimamboukar@gmail.com, name: Baimam JJ}',
          //       'organization': "Baimam's Space",
          //       'subject': "Invitation to Join Baimam's Space on AnoraAI 💐",
          //       'html': '',
          //       'uid': '233f8be6-b74a-4e0c-9942-be6dcace2264',
          //       'on': '2024-05-21T11:09:55.633907',
          //       'role': 'MANAGER',
          //     };
          //     final invitation = Invitation.fromMap(x, fromInvite: true);
          //     context.router.push(
          //       SignupRoute(invitation: invitation),
          //     );
          //   },
          // ),
          // 24.vGap,
          // ShadButton(
          //   text: const Text('Welcome'),
          //   onPressed: () {
          //     context.router.pushNamed(WELCOME_ROUTE);
          //   },
          // ),
        ],
      ).hPadding.vPadding,
    );
  }
}

class PaywallAction extends StatelessWidget {
  const PaywallAction({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.router.push(const PaywallRoute());
      },
      child: Container(
        width: context.width,
        height: 180,
        decoration: BoxDecoration(
          color: context.colorScheme.ring,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Anora AI Premium ✨', style: context.head),
                  8.vGap,
                  Text(
                    'Upgrade to premium to unlock unlimited access on Anora Spaces',
                    style: context.paragraph,
                  ),
                  10.vGap,
                  Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      color: context.colorScheme.muted,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Center(
                      child: Text('Upgrade Now 💎', style: context.title),
                    ),
                  ),
                ],
              ),
            ),
            const ShadImage(Assets.assetsLauncherIcon),
          ],
        ).hPadding.vPadding,
      ),
    );
  }
}

class GlassCircleBox extends StatelessWidget {
  const GlassCircleBox({required this.icon, super.key});
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(
          children: [
            // Glass effect background
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            // Icon in the center
            Center(
              child: icon,
            ),
          ],
        ),
      ),
    );
  }
}
