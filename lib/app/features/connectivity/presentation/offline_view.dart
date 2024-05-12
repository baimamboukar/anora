// ignore_for_file: lines_longer_than_80_chars

import 'package:anora/core/core.dart';
import 'package:flutter/material.dart';

class OfflineView extends StatelessWidget {
  const OfflineView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Container(
          decoration: BoxDecoration(
            color: context.colorScheme.primaryForeground,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.wifi_off,
                  size: 54,
                  color: context.colorScheme.primary,
                ),
                Center(
                  child: Text(
                    'Opps! We could not connect to the internet. Please check your connection and try again',
                    textAlign: TextAlign.center,
                    style: context.paragraph.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
                14.vGap,
                TextButton(
                  onPressed: () {},
                  child: const Text('Reconnect'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
