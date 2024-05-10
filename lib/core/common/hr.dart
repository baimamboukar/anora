import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class HR extends StatelessWidget {
  const HR({super.key});

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
