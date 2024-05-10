import 'package:anora/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AdvancedConfigsPage extends StatefulWidget {
  const AdvancedConfigsPage({super.key});

  @override
  State<AdvancedConfigsPage> createState() => _AdvancedConfigsPageState();
}

class _AdvancedConfigsPageState extends State<AdvancedConfigsPage> {
  @override
  Widget build(BuildContext context) {
    return AnoraPage(
      appBar: AppBar(
        title: const Text('My Space'),
      ),
      child: const Column(
        children: [
          Text('MY SPACE'),
        ],
      ),
    );
  }
}
