import 'package:anora/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NotificationsConfigPage extends StatefulWidget {
  const NotificationsConfigPage({super.key});

  @override
  State<NotificationsConfigPage> createState() =>
      _NotificationsConfigPageState();
}

class _NotificationsConfigPageState extends State<NotificationsConfigPage> {
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
