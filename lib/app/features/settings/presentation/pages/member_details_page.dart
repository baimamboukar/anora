import 'package:anora/app/features/auth/data/models/invitation_model.dart';
import 'package:anora/app/features/settings/settings.dart';
import 'package:anora/core/constants/anora_constants.dart';
import 'package:anora/core/core.dart';
import 'package:anora/core/extensions/authx.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class MemberDetailsPage extends StatefulWidget {
  const MemberDetailsPage({required this.member, super.key});
  final Invitation member;

  @override
  State<MemberDetailsPage> createState() => _MemberDetailsPageState();
}

class _MemberDetailsPageState extends State<MemberDetailsPage> {
  @override
  Widget build(BuildContext context) {
    final member = widget.member;
    final isPending =
        DateTime.now().isAfter(member.on.add(const Duration(days: 1)));
    return AnoraPage(
      withoutSingleScroll: true,
      appBar: AppBar(
        title: Text(
          member.to.first.name.isEmpty ? 'Empty' : member.to.first.name,
        ),
      ),
      child: Column(
        children: [
          14.vGap,
          const CircleAvatar(
            radius: 48,
            backgroundImage: NetworkImage(
              DEFAULT_PROFILE,
            ),
          ).floatC,
          8.vGap,
          Text(
            member.to.first.name,
            style: context.head,
          ),
          Text(member.to.first.email, style: context.desc),
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
                Text(
                  isPending
                      ? 'Invitation sent is still pending '
                      : 'Invitation has been accepted',
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    isPending ? 'Resend' : 'Revoke',
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
                  isPending ? 'Pending' : 'Accepted',
                  style: context.desc,
                ),
              ),
              ActionLabel(
                title: 'Permission',
                icon: HeroIcons.lifebuoy,
                trailing: Text(
                  member.role,
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
