import 'package:anora/app/router/router_paths.dart';
import 'package:anora/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class ActionLabel extends StatelessWidget {
  const ActionLabel({
    required this.title,
    required this.icon,
    this.trailing,
    super.key,
  });
  final String title;
  final HeroIcons icon;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.router.pushNamed(MY_SPACE_CONFIG_ROUTE);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            HeroIcon(icon),
            6.hGap,
            Text(title),
            const Spacer(),
            if (trailing != null) trailing!,
            8.hGap,
            const HeroIcon(
              HeroIcons.chevronRight,
              size: 10,
            ),
          ],
        ),
      ),
    );
  }
}
