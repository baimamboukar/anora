import 'package:anora/app/features/settings/data/models/integration_model.dart';
import 'package:anora/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class IntegrationTypePage extends StatefulWidget {
  const IntegrationTypePage({required this.integration, super.key});
  final Integration integration;

  @override
  State<IntegrationTypePage> createState() => _IntegrationTypeState();
}

class _IntegrationTypeState extends State<IntegrationTypePage> {
  @override
  Widget build(BuildContext context) {
    return AnoraPage(
      appBar: AppBar(
        title: Text(widget.integration.title),
      ),
      child: Column(
        children: [
          ShadImage(
            widget.integration.icon,
            width: 154,
            height: 154,
          ).floatC,
          14.vGap,
          Container(
            //height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.colorScheme.ring,
              borderRadius: BorderRadius.circular(12),
              //border: Border.all(color: theme.colorScheme.primary, width: .4),
            ),
            child: Column(
              children: [
                Text(
                  'PDF Integration is all Good!',
                  style: context.title,
                ).format.floatL,
                const Text(
                  'You dont need any permission or access token to integrate PDFs',
                ).format,
              ],
            ).hPadding.vPadding,
          ),
          24.vGap,
          Text(
            'knowledge bases',
            style: context.head,
          ).floatL,
          8.vGap,
          Text(
            'You can create knowledge bases and add up to 5 documents',
            style: context.desc,
          ).floatL,
        ],
      ),
    );
  }
}
