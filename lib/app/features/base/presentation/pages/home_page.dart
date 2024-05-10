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
          text: const Text('Show Dialog'),
          onPressed: () {
            showShadDialog<void>(
              context: context,
              builder: (context) => ShadDialog.alert(
                title: const Text('Are you absolutely sure?'),
                description: const Padding(
                  padding: EdgeInsets.all(24),
                  child: Text(
                    'This action cannot be undone. This will permanently delete your account?',
                  ),
                ),
                actions: [
                  ShadButton.outline(
                    text: const Text('Cancel'),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                  ShadButton(
                    text: const Text('Continue'),
                    onPressed: () => Navigator.of(context).pop(true),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
