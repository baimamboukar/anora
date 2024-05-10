import 'package:anora/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LanguageConfigPage extends StatefulWidget {
  const LanguageConfigPage({super.key});

  @override
  State<LanguageConfigPage> createState() => _LanguageConfigPageState();
}

class _LanguageConfigPageState extends State<LanguageConfigPage> {
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
