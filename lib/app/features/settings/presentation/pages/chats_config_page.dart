import 'package:anora/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ChatsConfigPage extends StatefulWidget {
  const ChatsConfigPage({super.key});

  @override
  State<ChatsConfigPage> createState() => _ChatsConfigPageState();
}

class _ChatsConfigPageState extends State<ChatsConfigPage> {
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
