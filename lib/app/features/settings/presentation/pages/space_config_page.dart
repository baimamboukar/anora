import 'package:anora/app/features/settings/data/models/integration_model.dart';
import 'package:anora/core/core.dart';
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
          const Text('Integrations'),
          34.vGap,
          SizedBox(
            height: 154,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
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
