import 'package:anora/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    const userAvatar =
        'https://images.unsplash.com/photo-1531123897727-8f129e1688ce?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';
    return AnoraPage(
      appBar: AppBar(
        title: const Switcher(),
        actions: const [
          CircleAvatar(
            backgroundImage: NetworkImage(userAvatar),
          ),
        ],
      ),
      child: Column(
        children: [
          14.vGap,
          Text(
            'Hey, Baimam of Xenora 👋',
            style: context.head,
          ).floatL,
          Text(
            'How can I help you today?',
            style: context.paragraph
                .copyWith(color: context.colorScheme.selection),
          ).floatL,
          14.vGap,
          const ChatSuggestions(),
          14.vGap,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Chats',
                style: context.paragraph,
              ),
              HeroIcon(
                HeroIcons.chevronRight,
                color: context.colorScheme.primary,
                size: 16,
              ),
            ],
          ),
          //  8.vGap,
          const RecentChats(),
        ],
      ),
    );
  }
}

class RecentChats extends StatelessWidget {
  const RecentChats({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
            leading: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                color: context.colorScheme.muted,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const HeroIcon(
                HeroIcons.arrowPath,
                size: 16,
              ),
            ),
            title: const Text('Create content for LinkedIn page'),
          );
        },
      ),
    );
  }
}

class ChatSuggestions extends StatelessWidget {
  const ChatSuggestions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 114,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: ShadCard(
              rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
              columnMainAxisAlignment: MainAxisAlignment.center,
              //   columnCrossAxisAlignment: CrossAxisAlignment.center,
              rowCrossAxisAlignment: CrossAxisAlignment.center,
              padding: const EdgeInsets.all(8),
              width: 184,
              height: 114,
              backgroundColor: context.colorScheme.secondary,
              description: const Text('Documents'),
              //description: Text(integration.desc),
              content: const Text('Create a new document based on last chats'),
            ),
          );
        },
      ),
    );
  }
}

final focusIndex = ValueNotifier<int>(0);

class Switcher extends StatelessWidget {
  const Switcher({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: focusIndex,
      builder: (context, index, child) {
        return Container(
          //  width: context.width * widthRatio + 8,
          height: 38,
          decoration: BoxDecoration(
            color: context.colorScheme.muted,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Padding(
            padding: EdgeInsets.all(4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SwitchTab(
                  title: 'Chat',
                  icon: HeroIcons.sparkles,
                  index: 0,
                ),
                SwitchTab(
                  title: 'Search',
                  icon: HeroIcons.documentText,
                  index: 1,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SwitchTab extends StatelessWidget {
  const SwitchTab({
    required this.index,
    required this.title,
    required this.icon,
    super.key,
  });
  final String title;
  final HeroIcons icon;
  final int index;

  @override
  Widget build(BuildContext context) {
    const widthRatio = .35;
    return GestureDetector(
      onTap: () {
        focusIndex.value = index;
      },
      child: Container(
        width: context.width * widthRatio / 2,
        height: 40,
        decoration: BoxDecoration(
          color: focusIndex.value == index ? context.colorScheme.card : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (focusIndex.value == index) ...[
                HeroIcon(
                  icon,
                  color: context.colorScheme.primary,
                  size: 16,
                ),
                4.hGap,
              ],
              Text(
                title,
                style: context.desc,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
