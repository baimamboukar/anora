// ignore_for_file: lines_longer_than_80_chars, use_build_context_synchronously

import 'dart:math' as math;

import 'package:anora/app/features/auth/data/models/invitation_model.dart';
import 'package:anora/app/features/auth/domain/auth_cubit/auth_cubit.dart';
import 'package:anora/app/features/integrations/logic/integration_cubit.dart';
import 'package:anora/app/features/integrations/ui/pages/integration_type.dart';
import 'package:anora/app/features/settings/domain/auth_cubit/invitation_cubit.dart';
import 'package:anora/app/features/settings/settings.dart';
import 'package:anora/app/router/router.gr.dart';
import 'package:anora/core/constants/anora_constants.dart';
import 'package:anora/core/core.dart';
import 'package:anora/core/extensions/authx.dart';
import 'package:anora/core/extensions/stringx.dart';
import 'package:anora/src/app/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:heroicons/heroicons.dart';
import 'package:image_stack/image_stack.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

@RoutePage()
class SpacePage extends StatefulWidget implements AutoRouteWrapper {
  const SpacePage({super.key});

  @override
  State<SpacePage> createState() => _SpacePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InvitationsCubit>(create: (context) => InvitationsCubit()),
        BlocProvider(
          create: (context) => IntegrationCubit(),
        ),
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
      ],
      child: this,
    );
  }
}

class _SpacePageState extends State<SpacePage> {
  @override
  void initState() {
    super.initState();

    context.read<InvitationsCubit>().getInvitations(context.orgs.first.uid);
    context
        .read<IntegrationCubit>()
        .getKnowledgeBasesByOrganization(context.orgs.first.uid);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<InvitationsCubit, InvitationState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          invited: () async {
            await context.router.maybePop();
            ShadToaster.of(context).show(
              ShadToast(
                title: const Text('Success'),
                description: const Text('The Invitation has been send'),
                action: ShadButton.outline(
                  text: const Text('Okay'),
                  onPressed: () => ShadToaster.of(context).hide(),
                ),
              ),
            );
          },
          invitingFailed: () {
            ShadToaster.of(context).show(
              ShadToast.destructive(
                title: const Text('Uh oh! Something went wrong'),
                description:
                    const Text('There was a problem sending the invitation'),
                action: ShadButton.destructive(
                  text: const Text('Try again'),
                  decoration: ShadDecoration(
                    border: ShadBorder(
                      color: context.colorScheme.destructiveForeground,
                    ),
                  ),
                  onPressed: () => ShadToaster.of(context).hide(),
                ),
              ),
            );
          },
        );
      },
      child: AnoraPage(
        appBar: AppBar(
          title: Text(context.orgs.first.name),
        ),
        child: Column(
          children: [
            const SpaceSumarry(),
            14.vGap,
            const ConfigBloc(
              title: 'Integrations',
              desc:
                  'Integrations let you contextualize your prompts based on your custom Entrepise Data. Browse Integrations and add the ones you care about',
              content: IntegrationsList(),
            ),
            14.vGap,
            ConfigBloc(
              title: 'Knowledge Bases',
              action: ShadButton.ghost(
                onPressed: () {
                  showShadDialog<void>(
                    context: context,
                    builder: (context) => AddKnowledgeBase(
                      contextX: context,
                    ),
                  );
                },
                text: const Text(
                  'Add New',
                ),
              ),
              desc:
                  'Knowledge Bases are sets of unstructed data classified by topics. You can add or remove knowledge bases from this space',
              content: const KnowledgeBaseList(),
            ),
            14.vGap,
            ConfigBloc(
              title: 'Members',
              desc:
                  'Members are the people who have access to this space. You can add or remove members from this space',
              content: MembersList(contextX: context),
            ),
            24.vGap,
          ],
        ),
      ),
    );
  }
}

class MembersList extends StatelessWidget {
  const MembersList({required this.contextX, super.key});
  final BuildContext contextX;

  @override
  Widget build(BuildContext context) {
    final images = [
      DEFAULT_PROFILE,
      DEFAULT_PROFILE,
      DEFAULT_PROFILE,
      DEFAULT_PROFILE,
      DEFAULT_PROFILE,
    ];
    return BlocConsumer<InvitationsCubit, InvitationState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          invited: () async {
            await context.router.maybePop();
            await context
                .read<InvitationsCubit>()
                .getInvitations(context.orgs.first.uid);
          },
          gettingInvitationsFailed: (err) {
            ShadToaster.of(context).show(
              ShadToast.destructive(
                title: const Text('Uh oh! Something went wrong'),
                description:
                    const Text('There was a problem fetching the invitations'),
                action: ShadButton.destructive(
                  text: const Text('Try again'),
                  decoration: ShadDecoration(
                    border: ShadBorder(
                      color: context.colorScheme.destructiveForeground,
                    ),
                  ),
                  onPressed: () => ShadToaster.of(context).hide(),
                ),
              ),
            );
          },
          invitingFailed: () {
            ShadToaster.of(context).show(
              ShadToast.destructive(
                title: const Text('Uh oh! Something went wrong'),
                description:
                    const Text('There was a problem sending the invitation'),
                action: ShadButton.destructive(
                  text: const Text('Try again'),
                  decoration: ShadDecoration(
                    border: ShadBorder(
                      color: context.colorScheme.destructiveForeground,
                    ),
                  ),
                  onPressed: () => ShadToaster.of(context).hide(),
                ),
              ),
            );
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: SizedBox.shrink,
          gettingInvitations: () {
            return Column(
              children: [
                CupertinoActivityIndicator(
                  radius: 20,
                  color: context.colorScheme.ring,
                ),
                const Text('Getting Members'),
              ],
            );
          },
          gettingInvitationsSuccess: (invites) {
            return InkWell(
              onTap: () async {
                await showModalBottomSheet<void>(
                  showDragHandle: true,
                  //side: ShadSheetSide.bottom,
                  context: context,
                  builder: (context) =>
                      MembersPage(contextX: contextX, invites: invites),
                );
              },
              child: Container(
                height: 54,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: context.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(18),
                  //border: Border.all(color: theme.colorScheme.primary, width: .4),
                ),
                child: Row(
                  children: [
                    ImageStack(
                      imageRadius: 32,
                      imageBorderWidth: 0,
                      imageList: [DEFAULT_PROFILE * invites.length],
                      totalCount: images
                          .length, // If larger than images.length, will show extra empty circle
                    ),
                    8.hGap,
                    Text(
                      '${context.orgs.first.name} Members',
                      style: context.title,
                    ),
                    const Spacer(),
                    const HeroIcon(
                      HeroIcons.chevronRight,
                      size: 16,
                    ),
                  ],
                ).hPadding,
              ),
            );
          },
        );
      },
    );
  }
}

class MembersPage extends StatefulWidget {
  const MembersPage({
    required this.contextX,
    required this.invites,
    super.key,
  });
  final BuildContext contextX;
  final List<Invitation> invites;

  @override
  State<MembersPage> createState() => _MembersPageState();
}

class _MembersPageState extends State<MembersPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: [
          //1.vGap,
          Row(
            children: [
              Text(
                '${context.orgs.first.name} Members',
                style: context.head
                    .copyWith(color: context.colorScheme.primary, fontSize: 18),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  final roles = {
                    'ADMIN': 'Admin',
                    'MANAGER': 'Manager',
                    'MEMBER': 'Member',
                  };

                  showShadDialog<void>(
                    context: context,
                    builder: (context) => AddMemberAction(
                      roles: roles,
                      contextX: widget.contextX,
                    ),
                  );
                },
                child: Text(
                  'Add',
                  style: context.paragraph
                      .copyWith(color: context.colorScheme.foreground),
                ),
              ),
            ],
          ).hPadding,
          8.vGap,
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.width * .85),
            child: const ShadInput(
              placeholder: Text('Search Member...'),
              keyboardType: TextInputType.name,
            ),
          ),
          14.vGap,
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.invites.length,
              itemBuilder: (BuildContext context, int index) {
                final member = widget.invites[index];
                return ListTile(
                  onTap: () {
                    context.router.push(MemberDetailsRoute(member: member));
                  },
                  visualDensity:
                      const VisualDensity(vertical: -4, horizontal: -4),
                  leading: const CircleAvatar(
                    backgroundImage: NetworkImage(
                      DEFAULT_PROFILE,
                    ),
                  ),
                  trailing: Transform.rotate(
                    angle: math.pi / 4,
                    child: const HeroIcon(HeroIcons.chevronUpDown, size: 24),
                  ),
                  title: Text(member.to.first.name),
                  subtitle: Text(
                    member.to.first.email,
                    style: context.desc.copyWith(fontSize: 12),
                  ),
                );
              },
            ),
          ),
        ],
      ).hPadding,
    );
  }
}

class AddMemberAction extends StatefulWidget {
  const AddMemberAction({
    required this.roles,
    required this.contextX,
    super.key,
  });

  final Map<String, String> roles;
  final BuildContext contextX;

  @override
  State<AddMemberAction> createState() => _AddMemberActionState();
}

class _AddMemberActionState extends State<AddMemberAction> {
  final formKey = GlobalKey<ShadFormState>();
  late final TextEditingController nameController;
  late final TextEditingController emailController;
  late final TextEditingController permissionController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    permissionController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InvitationsCubit>(create: (context) => InvitationsCubit()),
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),
      ],
      child: ShadForm(
        key: formKey,
        child: ShadDialog(
          title: const Text('Add New Member'),
          description: const Text(
            'Provide necessary information to add a new member',
          ),
          content: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ShadInputFormField(
                  controller: nameController,
                  placeholder: const Text('Name of Invitee'),
                  validator: ValidationBuilder().required().build(),
                ),
                ShadInputFormField(
                  controller: emailController,
                  placeholder: const Text('alpha.romeo@xenora.org'),
                  keyboardType: TextInputType.emailAddress,
                  validator: ValidationBuilder()
                      .email()
                      .required()
                      .maxLength(25)
                      .build(),
                ),
                SizedBox(
                  height: 50,
                  width: context.width,
                  child: ShadSelectFormField<String>(
                    minWidth: context.width,
                    onSaved: (industry) {
                      if (industry != null) {
                        permissionController.text = industry;
                      }
                    },
                    onChanged: (industry) {
                      if (industry != null) {
                        permissionController.text = industry;
                      }
                    },
                    onReset: () => permissionController.clear(),
                    placeholder: const Text('Select a permission'),
                    options: [
                      ...widget.roles.entries.map(
                        (role) => ShadOption(
                          value: role.key,
                          child: Text(role.value),
                        ),
                      ),
                    ],
                    selectedOptionBuilder: (context, value) =>
                        Text(widget.roles[value]!),
                  ),
                ),
              ],
            ),
          ).hPadding,
          actions: [
            BlocBuilder<InvitationsCubit, InvitationState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => ShadButton(
                    onPressed: () async {
                      if (formKey.currentState!.saveAndValidate()) {
                        await widget.contextX
                            .read<InvitationsCubit>()
                            .sendInvitation(
                              emailController.text,
                              nameController.text.trim(),
                              permissionController.text,
                              context.user!.names,
                              context.orgs.first.name,
                              context.orgs.first.uid,
                            );
                      }
                    },
                    text: const Text('Confirm'),
                  ),
                  inviting: () => ShadButton(
                    enabled: false,
                    icon: const CupertinoActivityIndicator().hPaddingx(8),
                    text: const Text('Inviting...'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SheetDragger extends StatelessWidget {
  const SheetDragger({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 74,
      decoration: BoxDecoration(
        color: context.colorScheme.secondaryForeground,
        borderRadius: BorderRadius.circular(24),
        //border: Border.all(color: theme.colorScheme.primary, width: .4),
      ),
    );
  }
}

class SpaceSumarry extends StatelessWidget {
  const SpaceSumarry({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(18),
        //border: Border.all(color: theme.colorScheme.primary, width: .4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: context.colorScheme.foreground,
                    ),
                    child: Image.asset(Assets.assetsLauncherIcon),
                    // Image.network(context.orgs.first.logo),
                  ),
                ),
                8.hGap,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(context.orgs.first.name, style: context.title),
                        8.hGap,
                        Visibility(
                          visible: context.orgs.first.verified,
                          child: const HeroIcon(
                            HeroIcons.checkBadge,
                            color: Colors.green,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      context.orgs.first.industry.toIndustryDisplayName,
                      style: context.paragraph,
                    ),
                    Text('04 Members', style: context.desc),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ConfigBloc extends StatelessWidget {
  const ConfigBloc({
    required this.title,
    required this.desc,
    required this.content,
    this.action,
    super.key,
  });
  final String title;
  final String desc;
  final Widget content;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: context.head,
            ).floatL,
            if (action != null) action!,
          ],
        ),
        8.vGap,
        Text(
          desc,
          style: context.desc,
        ),
        14.vGap,
        content,
      ],
    );
  }
}

class IntegrationsList extends StatelessWidget {
  const IntegrationsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 154,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: integrations.length,
        itemBuilder: (BuildContext context, int index) {
          final integration = integrations[index];
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GestureDetector(
              onTap: () async {
                await context.router.push(
                  IntegrationTypeRoute(integration: integration),
                );
              },
              child: IntegrationCard(
                integration: integration,
              ),
            ),
          );
        },
      ),
    );
  }
}
