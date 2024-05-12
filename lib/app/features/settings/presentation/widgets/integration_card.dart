import 'package:anora/app/features/settings/data/models/integration_model.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
        replacement: const HeroIcon(
          HeroIcons.plusCircle,
          color: Colors.green,
        ),
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
