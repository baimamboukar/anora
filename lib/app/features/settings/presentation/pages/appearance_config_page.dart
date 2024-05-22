import 'package:anora/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ApperanceConfigPage extends StatefulWidget {
  const ApperanceConfigPage({super.key});

  @override
  State<ApperanceConfigPage> createState() => _ApperanceConfigPageState();
}

class _ApperanceConfigPageState extends State<ApperanceConfigPage> {
  @override
  Widget build(BuildContext context) {
    return AnoraPage(
      appBar: AppBar(
        title: const Text('context.orgs.first.name'),
      ),
      child: const Column(
        children: [
          Text('MY SPACE'),
        ],
      ),
    );
  }
}
