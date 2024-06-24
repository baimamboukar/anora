import 'package:anora/app/features/auth/domain/auth_cubit/auth_cubit.dart';
import 'package:anora/core/core.dart';
import 'package:anora/src/app/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: context.width,
            height: 220,
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
                        'Upgrade to premium to unlock unlimited access and 5GB+ storage on Anora Spaces',
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
                          child: Text('Upgrade Now ✨', style: context.title),
                        ),
                      ),
                    ],
                  ),
                ),
                const ShadImage(Assets.assetsLauncherIcon),
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
