import 'package:anora/app/router/router_paths.dart';
import 'package:anora/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                colors: [
                  context.colorScheme.primary.withOpacity(.7),
                  context.colorScheme.primary.withOpacity(.2),
                ],
              ),
              // image: const DecorationImage(
              //   image: AssetImage(Assets.assetsIconsAppIcon),
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: context.theme.colorScheme.background,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  colors: [
                    context.colorScheme.primary.withOpacity(.7),
                    context.colorScheme.primary.withOpacity(.8),
                    context.colorScheme.primary.withOpacity(.9),
                    context.colorScheme.primary.withOpacity(1),
                  ],
                ),
              ),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    'Welcome to Intellibra',
                    style: context.head.copyWith(
                      color: context.colorScheme.primaryForeground,
                    ),
                  ),
                  const Spacer(),
                  ShadButton(
                    text: const Text('Take to Anora AI'),
                    onPressed: () {
                      context.router.pushNamed(LOGIN_ROUTE);
                    },
                  ),
                  TextButton(
                    onPressed: () {
                      context.router.pushNamed(SIGNUP_ROUTE);
                    },
                    // icon: const Icon(Icons.add),
                    child: Text(
                      'Sign Up',
                      style: context.paragraph.copyWith(
                        fontSize: 14,
                        color: context.colorScheme.primaryForeground,
                      ),
                    ),
                  ),
                  20.vGap,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
