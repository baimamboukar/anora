// ignore_for_file: lines_longer_than_80_chars

import 'dart:math' as math;

import 'package:anora/app/features/settings/settings.dart';
import 'package:anora/app/router/router_paths.dart';
import 'package:anora/core/core.dart';
import 'package:anora/src/app/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:image_stack/image_stack.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class SpacePage extends StatefulWidget {
  const SpacePage({super.key});

  @override
  State<SpacePage> createState() => _SpacePageState();
}

class _SpacePageState extends State<SpacePage> {
  @override
  Widget build(BuildContext context) {
    return AnoraPage(
      appBar: AppBar(
        title: const Text('My Space'),
      ),
      child: Column(
        children: [
          const SpaceSumarry(),
          14.vGap,
          const ConfigBloc(
            title: 'Integrations',
            desc:
                'Integrations let you contextualize your prompts based on your custom Entrepise Data. Browse Integrations and add the ones you care about',
            content: IntegrationsList(),
          ),
          const ConfigBloc(
            title: 'Members',
            desc:
                'Members are the people who have access to this space. You can add or remove members from this space',
            content: MembersList(),
          ),
        ],
      ),
    );
  }
}

class MembersList extends StatelessWidget {
  const MembersList({super.key});

  @override
  Widget build(BuildContext context) {
    const userAvatar =
        'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    final images = [userAvatar, userAvatar, userAvatar, userAvatar, userAvatar];
    return InkWell(
      onTap: () async {
        await showModalBottomSheet<void>(
          showDragHandle: true,
          //side: ShadSheetSide.bottom,
          context: context,
          builder: (context) => const MembersPage(),
        );
      },
      child: Container(
        height: 54,
        width: double.infinity,
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(18),
          //border: Border.all(color: theme.colorScheme.primary, width: .4),
        ),
        child: Row(
          children: [
            ImageStack(
              imageRadius: 32,
              imageBorderWidth: 0,
              imageList: images,
              totalCount: images
                  .length, // If larger than images.length, will show extra empty circle
            ),
            8.hGap,
            const Text('54 Members'),
            const Spacer(),
            const HeroIcon(
              HeroIcons.chevronRight,
              size: 16,
            ),
          ],
        ).hPadding,
      ),
    );
  }
}

class MembersPage extends StatefulWidget {
  const MembersPage({
    super.key,
  });

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          //1.vGap,
          Row(
            children: [
              Text(
                'Xenora AI Members',
                style: context.head
                    .copyWith(color: context.colorScheme.primary, fontSize: 18),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  final fruits = {
                    'ADMIN': 'Admin',
                    'MANAGER': 'Manager',
                    'MEMBER': 'Member',
                  };

                  showShadDialog<void>(
                    context: context,
                    builder: (context) => ShadDialog(
                      title: const Text('Add New Member'),
                      description: const Text(
                        'Provide necessary information to add a new member',
                      ),
                      content: Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const ShadInput(
                              placeholder: Text('alpha.romeo@xenora.org'),
                            ),
                            SizedBox(
                              height: 44,
                              width: context.width,
                              child: ShadSelect<String>(
                                placeholder: const Text('Select a permission'),
                                options: [
                                  ...fruits.entries.map(
                                    (e) => ShadOption(
                                      value: e.key,
                                      child: Text(e.value),
                                    ),
                                  ),
                                ],
                                selectedOptionBuilder: (context, value) =>
                                    Text(fruits[value]!),
                              ),
                            ),
                          ],
                        ),
                      ).hPadding,
                      actions: const [ShadButton(text: Text('Confirm'))],
                    ),
                  );
                },
                child: Text(
                  'Add',
                  style: context.paragraph
                      .copyWith(color: context.colorScheme.foreground),
                ),
              ),
            ],
          ).hPadding,
          8.vGap,
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.width * .85),
            child: const ShadInput(
              placeholder: Text('Search Member...'),
              keyboardType: TextInputType.name,
            ),
          ),
          14.vGap,
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    context.router.pushNamed(MEMBER_DETAILS_ROUTE);
                  },
                  visualDensity:
                      const VisualDensity(vertical: -4, horizontal: -4),
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                    ),
                  ),
                  trailing: Transform.rotate(
                    angle: math.pi / 4,
                    child: const HeroIcon(HeroIcons.chevronUpDown, size: 24),
                  ),
                  title: const Text('Baimam Boukar'),
                  subtitle: Text(
                    'baimamboukar@xenora.org',
                    style: context.desc.copyWith(fontSize: 12),
                  ),
                );
              },
            ),
          ),
        ],
      ).hPadding,
    );
  }
}

class SheetDragger extends StatelessWidget {
  const SheetDragger({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 74,
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryForeground,
        borderRadius: BorderRadius.circular(24),
        //border: Border.all(color: theme.colorScheme.primary, width: .4),
      ),
    );
  }
}

class SpaceSumarry extends StatelessWidget {
  const SpaceSumarry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(18),
        //border: Border.all(color: theme.colorScheme.primary, width: .4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.colorScheme.foreground,
                    ),
                    child: Image.asset(Assets.assetsLauncherIcon),
                  ),
                ),
                8.hGap,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Xenora AI', style: context.title),
                        4.hGap,
                        const HeroIcon(
                          HeroIcons.checkBadge,
                          color: Colors.blue,
                          size: 20,
                        ),
                      ],
                    ),
                    Text('AI and Technologies', style: context.paragraph),
                    Text('54 Members', style: context.desc),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ConfigBloc extends StatelessWidget {
  const ConfigBloc({
    required this.title,
    required this.desc,
    required this.content,
    super.key,
  });
  final String title;
  final String desc;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: context.head,
        ).floatL,
        8.vGap,
        Text(
          desc,
          style: context.desc,
        ),
        14.vGap,
        content,
      ],
    );
  }
}

class IntegrationsList extends StatelessWidget {
  const IntegrationsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 154,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: integrations.length,
        itemBuilder: (BuildContext context, int index) {
          final integration = integrations[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: IntegrationCard(
              integration: integration,
            ),
          );
        },
      ),
    );
  }
}
