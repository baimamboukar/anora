import 'package:anora/app/features/auth/domain/auth_cubit/auth_cubit.dart';
import 'package:anora/app/features/settings/settings.dart';
import 'package:anora/app/router/router_paths.dart';
import 'package:anora/core/core.dart';
import 'package:anora/core/extensions/authx.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class ProfilePage extends StatefulWidget implements AutoRouteWrapper {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: this,
    );
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    // _getLocales();
  }

  @override
  Widget build(BuildContext context) {
    const userAvatar =
        'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    final theme = ShadTheme.of(context);
    return AnoraPage(
      child: Column(
        children: [
          54.vGap,
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Profile',
              style: theme.textTheme.h2,
            ),
          ),
          14.vGap,
          Container(
            //height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary,
              borderRadius: BorderRadius.circular(18),
              //border: Border.all(color: theme.colorScheme.primary, width: .4),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(userAvatar),
                  ),
                  title: Text(context.user!.names),
                  subtitle: Text(context.user!.email),
                  trailing: (context.org?.verified ?? false)
                      ? const HeroIcon(
                          HeroIcons.checkBadge,
                          color: Colors.green,
                        )
                      : null,
                ),
              ],
            ),
          ),
          54.vGap,
          const ActionsBloc(
            actions: [
              ActionLabel(
                title: 'My Space',
                icon: HeroIcons.squares2x2,
              ),
              ActionLabel(
                title: 'Chats',
                icon: HeroIcons.chatBubbleOvalLeft,
              ),
              ActionLabel(
                title: 'Downloads',
                icon: HeroIcons.cloudArrowDown,
              ),
            ],
          ),
          24.vGap,
          const ActionsBloc(
            actions: [
              ActionLabel(
                title: 'Appearance',
                icon: HeroIcons.swatch,
              ),
              ActionLabel(
                title: 'Notifications',
                icon: HeroIcons.bellAlert,
              ),
              ActionLabel(
                title: 'Language',
                icon: HeroIcons.language,
              ),
              ActionLabel(
                title: 'Advanced',
                icon: HeroIcons.cog,
              ),
            ],
          ),
          24.vGap,
          const ActionsBloc(
            actions: [
              ActionLabel(
                title: 'Data Privacy',
                icon: HeroIcons.circleStack,
              ),
              ActionLabel(
                title: 'Terms & Conditions',
                icon: HeroIcons.documentCheck,
              ),
              ActionLabel(
                title: 'Support',
                icon: HeroIcons.informationCircle,
              ),
              ActionLabel(
                title: 'Tell a Friend',
                icon: HeroIcons.heart,
              ),
            ],
          ),
          14.vGap,
          LogoutAction(theme: theme),
        ],
      ),
    );
  }
}

class LogoutAction extends StatelessWidget {
  const LogoutAction({
    required this.theme,
    super.key,
  });

  final ShadThemeData theme;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          logoutFailure: () {
            ShadToaster.of(context).show(
              ShadToast.destructive(
                title: const Text('Something Went Wrong'),
                description: const Text(
                  'Failed to logout user',
                ),
                action: ShadButton.destructive(
                  text: const Text('Try again'),
                  decoration: ShadDecoration(
                    border: ShadBorder(
                      color: context.colorScheme.destructiveForeground,
                    ),
                  ),
                  onPressed: () => ShadToaster.of(context).hide(),
                ),
              ),
            );
          },
          loggedOut: () {
            context.router.popUntilRoot();
            context.router.replaceNamed(LOGIN_ROUTE);
          },
        );
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () async {
            await context.read<AuthCubit>().logout();
          },
          child: Container(
            //height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colorScheme.destructive.withOpacity(.78),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const HeroIcon(
                  HeroIcons.power,
                  size: 14,
                ),
                8.hGap,
                const Text('Logout'),
              ],
            ).vPadding.hPadding,
          ),
        );
      },
    );
  }
}
