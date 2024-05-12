// ignore_for_file: lines_longer_than_80_chars

import 'package:anora/app/features/settings/data/models/integration_model.dart';
import 'package:anora/core/core.dart';
import 'package:anora/src/app/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
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
          Container(
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
                          Text('Xenora AI', style: context.title),
                          Text('54 Members', style: context.desc),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          14.vGap,
          Text(
            'Integrations',
            style: context.head,
          ).floatL,
          8.vGap,
          Text(
            'Integrations let you contextualize your prompts based on your custom Entrepise Data. Browse Integrations and add the ones you care about',
            style: context.desc,
          ),
          14.vGap,
          SizedBox(
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
          ),
        ],
      ),
    );
  }
}

class IntegrationCard extends StatelessWidget {
  const IntegrationCard({
    required this.integration,
    super.key,
  });
  final Integration integration;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return ShadCard(
      padding: const EdgeInsets.all(8),
      width: 164,
      height: 134,
      backgroundColor: theme.colorScheme.secondary,
      trailing: Visibility(
        visible: integration.integrated,
        child: const HeroIcon(
          HeroIcons.checkCircle,
          color: Colors.green,
        ),
      ),
      title: Text(integration.title),
      description: Text(integration.desc),
      content: Center(
        child: ShadImage.square(
          integration.icon,
          size: 64,
        ),
      ),
    );
  }
}
