import 'dart:math' as math;

import 'package:anora/app/features/auth/domain/auth_cubit/auth_cubit.dart';
import 'package:anora/core/core.dart';
import 'package:anora/core/data.dart';
import 'package:anora/core/extensions/authx.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class ChatPage extends StatefulWidget implements AutoRouteWrapper {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: this,
    );
  }
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return AnoraPage(
      withoutSingleScroll: true,
      withPadding: false,
      appBar: AppBar(
        title: const Switcher(),
        centerTitle: true,
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage(context.user!.photo),
          ),
        ],
      ),
      child: Column(
        children: [
          const ChatHome(),
          Container(
            width: context.width,
            height: context.height * .175,
            decoration: BoxDecoration(
              color: context.colorScheme.muted,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
            ),
            child: Column(
              children: [
                Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Type, talk or upload an image...',
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: context.desc.copyWith(fontSize: 20),
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: const EdgeInsets.all(2),
                        ),
                      ),
                    ),
                    Transform.rotate(
                      angle: math.pi / 4,
                      child: const HeroIcon(HeroIcons.chevronUpDown, size: 24),
                    ),
                  ],
                ),
                const Spacer(),
                Row(
                  children: [
                    const Spacer(),
                    Container(
                      // width: context.width * .3,
                      height: 48,
                      decoration: BoxDecoration(
                        color: context.colorScheme.primary,
                        borderRadius: BorderRadius.circular(
                          24,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(Icons.keyboard_alt_outlined, size: 24)
                              .hPaddingx(8),
                          // AvatarGlow(
                          // backgroundColor: context.colorScheme.background,
                          //child:
                          const HeroIcon(HeroIcons.microphone, size: 24)
                              .hPaddingx(8),
                          //),
                          const HeroIcon(HeroIcons.camera, size: 24)
                              .hPaddingx(8),
                        ],
                      ).hPadding,
                    ).vPaddingx(8),
                    const Spacer(),
                    ShadButton.outline(
                      icon: const HeroIcon(HeroIcons.paperAirplane, size: 24),
                      size: ShadButtonSize.icon,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ).hPadding,
          ),
        ],
      ),
    );
  }
}

class ChatHome extends StatelessWidget {
  const ChatHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Text(
            'Hey, Baimam of Xenora 👋',
            style: context.head,
          ).floatL.hPadding,
          Text(
            'How can I help you today?',
            style: context.paragraph
                .copyWith(color: context.colorScheme.selection),
          ).floatL.hPadding,
          14.vGap,
          const ChatSuggestions().hPadding,
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
          ).hPadding,
          //  8.vGap,
          const RecentChats().hPadding,
          //   const Switcher(),
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
        itemCount: suggestions.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final data = suggestions[index].split(':');
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
              description: Text(data.first),
              //description: Text(integration.desc),
              content: Text(data[1]),
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
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SwitchTab(
                  title: 'Chat',
                  icon: HeroIcons.sparkles,
                  index: 0,
                  activeIndex: index,
                ),
                SwitchTab(
                  title: 'Search',
                  icon: HeroIcons.documentText,
                  index: 1,
                  activeIndex: index,
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
    required this.activeIndex,
    required this.icon,
    super.key,
  });
  final String title;
  final HeroIcons icon;
  final int index;
  final int activeIndex;

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
          color: activeIndex == index ? context.colorScheme.card : null,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (activeIndex == index) ...[
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
