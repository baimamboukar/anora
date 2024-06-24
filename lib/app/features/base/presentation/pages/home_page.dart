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
import 'package:syncfusion_flutter_gauges/gauges.dart';

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
          14.vGap,
          const PaywallAction(),
          14.vGap,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActionBox(
                width: width,
                max: true,
                color: context.colorScheme.selection,
                text: 'Get Insights on Your Sales Data',
                icon: HeroIcons.sparkles,
                height: 320,
              ),
              10.hGap,
              Column(
                children: [
                  ActionBox(
                    width: width,
                    color: context.colorScheme.primary,
                    text: 'Manage Your Knowledge Base',
                    icon: HeroIcons.rectangleGroup,
                    height: 156,
                  ),
                  8.vGap,
                  ActionBox(
                    width: width,
                    color: context.colorScheme.destructive,
                    text: 'Sync Your Data In One Click',
                    icon: HeroIcons.cursorArrowRipple,
                    height: 156,
                  ),
                ],
              ),
            ],
          ),
          10.vGap,

          Container(
            width: context.width,
            height: 168,
            decoration: BoxDecoration(
              color: context.colorScheme.ring.withOpacity(.5),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '300+',
                          style: context.head,
                        ),
                        Text(
                          'Requests Made',
                          style: context.paragraph,
                        ),
                        Text(
                          'View History',
                          style: context.desc,
                        ),
                      ],
                    ),
                    20.hGap,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2,200',
                          style: context.head,
                        ),
                        Text(
                          'Requests Left',
                          style: context.paragraph,
                        ),
                        Text(
                          'Upgrade for unlimited',
                          style: context.desc,
                        ),
                      ],
                    ),
                    const Spacer(),
                    const ScanGauge(),
                  ],
                ),
              ],
            ).hPadding.vPadding,
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

class ActionBox extends StatelessWidget {
  const ActionBox({
    required this.width,
    required this.height,
    required this.icon,
    required this.text,
    required this.color,
    super.key,
    this.max = false,
  });

  final double width;
  final double height;
  final HeroIcons icon;
  final String text;
  final Color color;
  final bool max;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GlassCircleBox(
                max: max,
                icon: HeroIcon(icon, size: max ? 48 : 32),
              ).floatL,
              const HeroIcon(HeroIcons.arrowUpRight).floatR,
            ],
          ),
          const Spacer(),
          Text(
            text,
            style: max ? context.header : context.head,
          ),
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
  const GlassCircleBox({required this.icon, this.max = false, super.key});
  final Widget icon;
  final bool max;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: max ? 80 : 60,
        height: max ? 80 : 60,
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

class ScanGauge extends StatelessWidget {
  const ScanGauge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 138,
      width: 128,
      child: SfRadialGauge(
        axes: <RadialAxis>[
          RadialAxis(
            interval: 10,
            showLabels: false,
            // showTicks: false,
            pointers: <GaugePointer>[
              RangePointer(
                value: 30,
                width: 8,
                color: context.colorScheme.primary,
                enableAnimation: true,
                cornerStyle: CornerStyle.bothCurve,
              ),
            ],
            annotations: <GaugeAnnotation>[
              GaugeAnnotation(
                widget: Padding(
                  padding: const EdgeInsets.only(top: 0.00001),
                  child: Container(
                    height: 84,
                    width: 84,
                    decoration: BoxDecoration(
                      color: context.colorScheme.primary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '12%',
                            style: context.paragraph.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'storage used',
                            style: context.paragraph.copyWith(
                              //   fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
