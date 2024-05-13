import 'package:flutter/material.dart';

class AnoraPage extends StatelessWidget {
  const AnoraPage({
    required this.child,
    super.key,
    this.appBar,
    this.withoutSingleScroll = false,
    this.withPadding = true,
  });
  final Widget child;
  final AppBar? appBar;
  final bool withoutSingleScroll;
  final bool withPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: !withoutSingleScroll
          ? SingleChildScrollView(
              child: withPadding
                  ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: child,
                    )
                  : child,
            )
          : withPadding
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: child,
                )
              : child,
    );
  }
}
