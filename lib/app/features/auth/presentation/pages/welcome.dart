import 'package:anora/app/router/router_paths.dart';
import 'package:anora/core/core.dart';
import 'package:anora/src/app/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false,
      ),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: context.height,
                width: context.width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(Assets.assetsIconsWelcome),
                  ),
                ),
              ),
            ),
            14.vGap,
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      // Image.asset(
                      //   Assets.assetsLauncherIcon,
                      //   width: 50,
                      //   height: 50,
                      // ),
                      // 8.hGap,
                      Text(
                        'Anora AI',
                        style: context.header,
                      ),
                    ],
                  ),
                  Text(
                    'Make sense of your business data like never before',
                    style: context.paragraph,
                  ),
                  14.vGap,
                  GestureDetector(
                    onTap: () => context.router.pushNamed(SIGNUP_ROUTE),
                    child: Container(
                      height: 48,
                      width: context.width * .7,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: context.colorScheme.primary,
                      ),
                      child: Center(
                        child: Text(
                          'Create an Account',
                          style: context.paragraph,
                        ),
                      ),
                    ),
                  ),
                  10.vGap,
                  ShadButton.ghost(
                    size: ShadButtonSize.lg,
                    text: Text(
                      'Login to your account',
                      style: context.paragraph,
                    ),
                    onPressed: () => context.router.pushNamed(LOGIN_ROUTE),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// class WelcomePage extends StatelessWidget {
//   const WelcomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.5,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: Alignment.bottomRight,
//                 colors: [
//                   context.colorScheme.primary.withOpacity(.7),
//                   context.colorScheme.primary.withOpacity(.2),
//                 ],
//               ),
//               // image: const DecorationImage(
//               //   image: AssetImage(Assets.assetsIconsAppIcon),
//               //   fit: BoxFit.cover,
//               // ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: context.theme.colorScheme.background,
//                 gradient: LinearGradient(
//                   begin: Alignment.topRight,
//                   colors: [
//                     context.colorScheme.primary.withOpacity(.7),
//                     context.colorScheme.primary.withOpacity(.8),
//                     context.colorScheme.primary.withOpacity(.9),
//                     context.colorScheme.primary.withOpacity(1),
//                   ],
//                 ),
//               ),
//               width: double.infinity,
//               child: Column(
//                 children: [
//                   Text(
//                     'Welcome to Intellibra',
//                     style: context.head.copyWith(
//                       color: context.colorScheme.primaryForeground,
//                     ),
//                   ),
//                   const Spacer(),
//                   ShadButton(
//                     text: const Text('Take to Anora AI'),
//                     onPressed: () {
//                       context.router.pushNamed(LOGIN_ROUTE);
//                     },
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       context.router.pushNamed(SIGNUP_ROUTE);
//                     },
//                     // icon: const Icon(Icons.add),
//                     child: Text(
//                       'Sign Up',
//                       style: context.paragraph.copyWith(
//                         fontSize: 14,
//                         color: context.colorScheme.primaryForeground,
//                       ),
//                     ),
//                   ),
//                   20.vGap,
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
