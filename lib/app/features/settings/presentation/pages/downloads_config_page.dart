import 'package:anora/core/common/anora_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DownloadsConfigPage extends StatefulWidget {
  const DownloadsConfigPage({super.key});

  @override
  State<DownloadsConfigPage> createState() => _DownloadsConfigPageState();
}

class _DownloadsConfigPageState extends State<DownloadsConfigPage> {
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
