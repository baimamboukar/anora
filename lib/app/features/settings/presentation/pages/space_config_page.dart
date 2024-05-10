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
          const ShadCard(
            padding: EdgeInsets.all(8),
            width: 134,
            height: 124,
            content: Center(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HeroIcon(
                    HeroIcons.sparkles,
                    size: 32,
                  ),
                  Text('Web Data'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
