import 'package:anora/app/features/settings/settings.dart';
import 'package:anora/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
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
                  title: const Text('Baimam Boukar JJ'),
                  subtitle: const Text('baimamboukar@xenora.org'),
                  trailing: HeroIcon(
                    HeroIcons.checkBadge,
                    color: theme.colorScheme.ring,
                  ),
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
          34.vGap,
        ],
      ),
    );
  }
}
