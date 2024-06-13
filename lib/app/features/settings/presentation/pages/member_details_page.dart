import 'package:anora/app/features/settings/settings.dart';
import 'package:anora/core/core.dart';
import 'package:anora/core/extensions/authx.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class MemberDetailsPage extends StatefulWidget {
  const MemberDetailsPage({super.key});

  @override
  State<MemberDetailsPage> createState() => _MemberDetailsPageState();
}

class _MemberDetailsPageState extends State<MemberDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return AnoraPage(
      withoutSingleScroll: true,
      appBar: AppBar(
        title: const Text('Baimam Boukar'),
      ),
      child: Column(
        children: [
          14.vGap,
          const CircleAvatar(
            radius: 48,
            backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
          ).floatC,
          8.vGap,
          Text(
            'Baimam Boukar JJ',
            style: context.head,
          ),
          Text('baimamboukar@gmail.com', style: context.desc),
          10.vGap,
          Container(
            width: double.infinity,
            height: 54,
            decoration: BoxDecoration(
              color: context.colorScheme.selection,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                const Text('Invitation sent is still pending '),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend',
                    style: context.paragraph
                        .copyWith(color: context.colorScheme.foreground),
                  ),
                ),
              ],
            ).hPadding,
          ),
          24.vGap,
          ActionsBloc(
            actions: [
              ActionLabel(
                title: 'Invitation Status',
                icon: HeroIcons.envelope,
                trailing: Text(
                  'Pending',
                  style: context.desc,
                ),
              ),
              ActionLabel(
                title: 'Permission',
                icon: HeroIcons.lifebuoy,
                trailing: Text(
                  'Space Admin',
                  style: context.desc,
                ),
              ),
              const ActionLabel(
                title: 'Downloads',
                icon: HeroIcons.cloudArrowDown,
              ),
            ],
          ),
          24.vGap,
          ShadButton.ghost(
            text: Text(
              'Remove from ${context.orgs.first.name}',
            ),
          ),
          34.vGap,
        ],
      ),
    );
  }
}
