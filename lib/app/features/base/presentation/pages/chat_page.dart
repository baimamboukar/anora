import 'dart:math' as math;

import 'package:anora/app/features/auth/data/models/space_models.dart';
import 'package:anora/app/features/auth/domain/auth_cubit/auth_cubit.dart';
import 'package:anora/app/features/base/presentation/widgets/recorder.dart';
import 'package:anora/app/features/chat/logic/models/anora_prompt.dart';
import 'package:anora/app/features/chat/logic/recent_chats_cubit/recent_chats_cubit.dart';
import 'package:anora/app/features/integrations/logic/integration_cubit.dart';
import 'package:anora/app/router/router.gr.dart';
import 'package:anora/core/core.dart';
import 'package:anora/core/data.dart';
import 'package:anora/core/extensions/authx.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:redacted/redacted.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

final knowledgeListener = ValueNotifier<SpaceKnowledgeBase?>(null);

@RoutePage()
class ChatPage extends StatefulWidget implements AutoRouteWrapper {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => IntegrationCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _ChatPageState extends State<ChatPage> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    // context
    //     .read<IntegrationCubit>()
    //     .getKnowledgeBasesByOrganization(context.orgs.first.uid);
  }

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
          ChatAction(controller: controller),
        ],
      ),
    );
  }
}

class ChatAction extends StatelessWidget {
  const ChatAction({
    required this.controller,
    super.key,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  controller: controller,
                  keyboardType: TextInputType.multiline,
                  onSubmitted: (query) {
                    if (query.isNotEmpty) {
                      context.router.push(
                        ChatroomRoute(
                          prompt: Prompt(text: controller.value.text),
                        ),
                      );
                    }
                  },
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
              Column(
                children: [
                  14.vGap,
                  InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        builder: (context) => const RecorderWidget(),
                        context: context,
                      );
                    },
                    child: Transform.rotate(
                      angle: math.pi / 4,
                      child: const HeroIcon(HeroIcons.chevronUpDown, size: 24),
                    ),
                  ),
                  14.vGap,
                  InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        builder: (context) => const RecorderWidget(),
                        context: context,
                      );
                    },
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(child: Text('1')),
                    ),
                  ),
                ],
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
                    const HeroIcon(HeroIcons.microphone, size: 24).hPaddingx(8),
                    //),
                    const HeroIcon(HeroIcons.camera, size: 24).hPaddingx(8),
                  ],
                ).hPadding,
              ).vPaddingx(8),
              const Spacer(),
              ShadButton.outline(
                icon: const HeroIcon(HeroIcons.paperAirplane, size: 24),
                size: ShadButtonSize.icon,
                onPressed: () {
                  if (controller.value.text.isNotEmpty) {
                    context.router.push(
                      ChatroomRoute(
                        prompt: Prompt(text: controller.value.text),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ).hPadding,
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
          const ActiveKnowledgeBase(),

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
          14.vGap,
          //   const Switcher(),
        ],
      ),
    );
  }
}

class ActiveKnowledgeBase extends StatelessWidget {
  const ActiveKnowledgeBase({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntegrationCubit, IntegrationState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          gettingKnowledges: () {
            return Container(
              height: 48,
              width: context.width * .7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: context.colorScheme.primary,
              ),
            ).redacted(context: context, redact: true);
          },
          gettingKnowledgeFailure: (err) {
            // failure in red and action to retry
            return const HeroIcon(
              HeroIcons.eyeDropper,
              color: Colors.red,
            );
          },
          gettingKnowledgeSuccess: (knowledgeBases) {
            knowledgeListener.value = knowledgeBases.last;
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Active Knowledge Base',
                      style: context.paragraph,
                    ),
                    CupertinoContextMenu(
                      enableHapticFeedback: true,
                      actions: [
                        for (int index = 0;
                            index < knowledgeBases.length;
                            index++)
                          CupertinoContextMenuAction(
                            child: Text(knowledgeBases[index].name),
                            onPressed: () {
                              context.router.maybePop();
                              knowledgeListener.value = knowledgeBases[index];
                            },
                          ),
                      ],
                      child: HeroIcon(
                        HeroIcons.cog6Tooth,
                        color: context.colorScheme.ring,
                      ),
                    ),
                  ],
                ).hPadding,
                ValueListenableBuilder(
                  valueListenable: knowledgeListener,
                  builder: (context, activeKnowledge, child) {
                    return Text(
                      activeKnowledge!.name,
                      style: context.paragraph
                          .copyWith(color: context.colorScheme.selection),
                    ).floatL.hPadding;
                  },
                ),
              ],
            );
          },
        );
      },
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
        itemCount: recents.length,
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
            title: Text(recents[index]),
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
