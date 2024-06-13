import 'package:anora/app/features/auth/data/models/space_models.dart';
import 'package:anora/core/common/anora_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class KnowledgeBasePage extends StatefulWidget {
  const KnowledgeBasePage({required this.knowledgeBase, super.key});
  final SpaceKnowledgeBase knowledgeBase;

  @override
  State<KnowledgeBasePage> createState() => _KnowledgeBasePageState();
}

class _KnowledgeBasePageState extends State<KnowledgeBasePage> {
  @override
  Widget build(BuildContext context) {
    return AnoraPage(
      appBar: AppBar(
        title: Text(widget.knowledgeBase.name),
      ),
      child: const Column(),
    );
  }
}
