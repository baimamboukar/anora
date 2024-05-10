import 'package:flutter/material.dart';

class AnoraPage extends StatelessWidget {
  const AnoraPage({required this.child, super.key, this.appBar});
  final Widget child;
  final AppBar? appBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: child,
        ),
      ),
    );
  }
}
