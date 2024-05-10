import 'package:anora/core/core.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ActionsBloc extends StatelessWidget {
  const ActionsBloc({
    required this.actions,
    super.key,
  });

  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: actions.seperateBy(
            const HR(),
          ),
        ),
      ),
    );
  }
}
