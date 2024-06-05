import 'dart:math' as math;

import 'package:anora/app/features/chat/logic/chat_cubit.dart';
import 'package:anora/app/features/chat/logic/models/anora_prompt.dart';
import 'package:anora/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:uuid/uuid.dart';

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
    context.read<ChatCubit>().init(widget.prompt, const Uuid().v4());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Query Chatroom'),
      ),
      body: Column(
        children: [
          const Text('Chatroom'),
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
