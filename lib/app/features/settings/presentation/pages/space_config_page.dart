// ignore_for_file: lines_longer_than_80_chars

import 'package:anora/app/features/settings/settings.dart';
import 'package:anora/core/core.dart';
import 'package:anora/src/app/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

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
            content: IntegrationsList(),
          ),
          const ConfigBloc(
            title: 'Members',
            desc:
                'Members are the people who have access to this space. You can add or remove members from this space',
            content: IntegrationsList(),
          ),
        ],
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
