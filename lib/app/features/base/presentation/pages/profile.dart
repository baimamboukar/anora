import 'dart:developer' as dev;

import 'package:anora/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:speech_to_text/speech_to_text.dart';

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

  Future<void> _getLocales() async {
    final instance = SpeechToText();
    final locales = await instance.locales();
    for (final locale in locales) {
      dev.log('name: ${locale.name} - iso: ${locale.localeId} |');
    }
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
                // const _HR(),
                // Padding(
                //   padding: const EdgeInsets.all(8) +
                //       const EdgeInsets.symmetric(horizontal: 6),
                //   child: const Text('Member of Xenora Organization'),
                // ),
              ],
            ),
          ),
          54.vGap,
          const ActionsBloc(
            actions: [
              Action(
                title: 'My Space',
                icon: HeroIcons.squares2x2,
              ),
              Action(
                title: 'Chats',
                icon: HeroIcons.chatBubbleOvalLeft,
              ),
              Action(
                title: 'Downloads',
                icon: HeroIcons.cloudArrowDown,
              ),
            ],
          ),
          24.vGap,
          const ActionsBloc(
            actions: [
              Action(
                title: 'Appearance',
                icon: HeroIcons.swatch,
              ),
              Action(
                title: 'Notifications',
                icon: HeroIcons.bellAlert,
              ),
              Action(
                title: 'Language',
                icon: HeroIcons.language,
              ),
              Action(
                title: 'Advanced',
                icon: HeroIcons.cog,
              ),
            ],
          ),
          24.vGap,
          const ActionsBloc(
            actions: [
              Action(
                title: 'Data Privacy',
                icon: HeroIcons.circleStack,
              ),
              Action(
                title: 'Terms & Conditions',
                icon: HeroIcons.documentCheck,
              ),
              Action(
                title: 'Support',
                icon: HeroIcons.informationCircle,
              ),
              Action(
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

class ActionsBloc extends StatelessWidget {
  const ActionsBloc({
    required this.actions,
    super.key,
  });

  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(18),
        //border: Border.all(color: theme.colorScheme.primary, width: .4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: actions.seperateBy(
            const _HR(),
          ),
        ),
      ),
    );
  }
}

class _HR extends StatelessWidget {
  const _HR({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Divider(
      height: 5,
      thickness: .085,
      indent: 30,
      color: theme.colorScheme.secondaryForeground,
    );
  }
}

class Action extends StatelessWidget {
  const Action({
    required this.title,
    required this.icon,
    super.key,
  });
  final String title;
  final HeroIcons icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          HeroIcon(icon),
          6.hGap,
          Text(title),
          const Spacer(),
          const HeroIcon(
            HeroIcons.chevronRight,
            size: 10,
          ),
        ],
      ),
    );
  }
}

extension X on List<Widget> {
  List<Widget> seperateBy(Widget seperator) {
    final widgets = <Widget>[];
    for (var i = 0; i < length; i++) {
      widgets.add(this[i]);
      if (i != length - 1) widgets.add(seperator);
    }
    return widgets;
  }
}
