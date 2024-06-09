import 'dart:math' as math;

import 'package:anora/app/features/chat/logic/cubit/chat_cubit.dart';
import 'package:anora/app/features/chat/logic/models/anora_prompt.dart';
import 'package:anora/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:markdown_widget/config/all.dart';
import 'package:markdown_widget/config/markdown_generator.dart';
import 'package:redacted/redacted.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class ChatroomPage extends StatefulWidget implements AutoRouteWrapper {
  const ChatroomPage({required this.prompt, super.key});
  final Prompt prompt;

  @override
  State<ChatroomPage> createState() => _ChatroomPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: this,
    );
  }
}

class _ChatroomPageState extends State<ChatroomPage> {
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    context.read<ChatCubit>().completeChat(promt: widget.prompt);
  }

  @override
  Widget build(BuildContext context) {
    final session = context.read<ChatCubit>().service.session;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Query Chatroom'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: session.history.length,
              itemBuilder: (BuildContext context, int index) {
                final message = session.history.toList()[index];

                return ChatWidget(
                  isAnora: message.role == 'model',
                  message: (message.parts.first.toJson()
                      as Map<String, dynamic>)['text'] as String,
                  // 'The _Beautiful_ `Thing` with learning is that no one can take it away from you.The Beautiful Thing with **learning** is that no one can take it away from you. ![Anora Image](assets/launcher_icon.png)',
                );
              },
            ),
          ),
          BlocBuilder<ChatCubit, ChatState>(
            builder: (context, state) {
              return state.maybeWhen(
                completing: () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Please Wait...'),
                    8.hGap,
                    const CupertinoActivityIndicator(),
                  ],
                ),
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
          34.vGap,
          ChatAction(controller: controller),
        ],
      ),
    );
  }
}

class ChatWidget extends StatelessWidget {
  const ChatWidget({
    required this.message,
    required this.isAnora,
    super.key,
  });
  final String message;
  final bool isAnora;

  @override
  Widget build(BuildContext context) {
    final generator = MarkdownGenerator();
    final widgets = generator.buildWidgets(message);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment:
          !isAnora ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        // 8.hGap,
        // if (isAnora)
        //   Image.asset(
        //     Assets.assetsLauncherIcon,
        //     width: 38,
        //   ),
        // 4.hGap,
        Container(
          width: context.width * .85,
          // height: 78,
          decoration: BoxDecoration(
            color:
                isAnora ? context.colorScheme.muted : context.colorScheme.ring,
            borderRadius: BorderRadius.circular(12),
          ),
          //child: const Center(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...widgets,
            ],
          ).hPadding.vPaddingx(8),
        ).redacted(context: context, redact: false).floatR.hPaddingx(8),
      ],
    ).vPadding;
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
              InkWell(
                child: Transform.rotate(
                  angle: math.pi / 4,
                  child: const HeroIcon(HeroIcons.chevronUpDown, size: 24),
                ),
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
                    // call Gemeni
                    context.read<ChatCubit>().completeChat(
                          promt: Prompt(text: controller.value.text),
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

/// Generator Config
