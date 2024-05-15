import 'package:anora/app/router/router_paths.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ShadButton.outline(
          text: const Text('Auth'),
          onPressed: () {
            context.router.pushNamed(LOGIN_ROUTE);
          },
        ),
      ),
    );
  }
}
