import 'package:anora/app/features/auth/domain/auth_cubit/auth_cubit.dart';
import 'package:anora/app/features/integrations/logic/integration_cubit.dart';
import 'package:anora/app/features/settings/data/models/integration_model.dart';
import 'package:anora/app/router/router.gr.dart';
import 'package:anora/core/core.dart';
import 'package:anora/core/extensions/authx.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:uuid/uuid.dart';

@RoutePage()
class IntegrationTypePage extends StatefulWidget implements AutoRouteWrapper {
  const IntegrationTypePage({required this.integration, super.key});
  final Integration integration;

  @override
  State<IntegrationTypePage> createState() => _IntegrationTypeState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => IntegrationCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _IntegrationTypeState extends State<IntegrationTypePage> {
  @override
  void initState() {
    super.initState();
    context
        .read<IntegrationCubit>()
        .getKnowledgeBasesByOrganization(context.orgs.first.uid);
  }

  @override
  Widget build(BuildContext context) {
    return AnoraPage(
      appBar: AppBar(
        title: Text(widget.integration.title),
      ),
      child: Column(
        children: [
          ShadImage(
            widget.integration.icon,
            width: 154,
            height: 154,
          ).floatC,
          14.vGap,
          Container(
            //height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.colorScheme.ring,
              borderRadius: BorderRadius.circular(12),
              //border: Border.all(color: theme.colorScheme.primary, width: .4),
            ),
            child: Column(
              children: [
                Text(
                  'PDF Integration is all Good!',
                  style: context.title,
                ).format.floatL,
                const Text(
                  'You dont need any permission or access token to integrate PDFs',
                ).format,
              ],
            ).hPadding.vPadding,
          ),
          24.vGap,
          Text(
            'knowledge bases',
            style: context.head,
          ).floatL,
          8.vGap,
          Text(
            'You can create knowledge bases and add up to 5 documents',
            style: context.desc,
          ).floatL,
          34.vGap,
        ],
      ),
    );
  }
}

class KnowledgeBaseList extends StatelessWidget {
  const KnowledgeBaseList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntegrationCubit, IntegrationState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          gettingKnowledges: () {
            return Column(
              children: [
                CupertinoActivityIndicator(
                  radius: 28,
                  color: context.colorScheme.ring,
                ),
                const Text('Getting Your Knowledge Bases'),
              ],
            );
          },
          gettingKnowledgeFailure: (err) {
            // failure in red and action to retry
            return const Text(
              'Failed to get Knowledge Bases',
              style: TextStyle(color: Colors.red),
            );
          },
          gettingKnowledgeSuccess: (knowledgeBases) {
            return Column(
              children: knowledgeBases
                  .map(
                    (knowledgeBase) => ListTile(
                      leading: const HeroIcon(HeroIcons.folder),
                      title: Text(
                        knowledgeBase.name,
                        style: context.title,
                      ),
                      onTap: () {
                        context.router.push(
                          KnowledgeBaseRoute(
                            knowledgeBase: knowledgeBase,
                          ),
                        );
                      },
                    ),
                  )
                  .toList(),
            );
          },
        );
      },
    );
  }
}

class AddKnowledgeBase extends StatefulWidget {
  const AddKnowledgeBase({required this.contextX, super.key});
  final BuildContext contextX;

  @override
  State<AddKnowledgeBase> createState() => _AddKnowledgeBaseState();
}

class _AddKnowledgeBaseState extends State<AddKnowledgeBase> {
  final formKey = GlobalKey<ShadFormState>();
  late final TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IntegrationCubit>(
          create: (context) => IntegrationCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
      ],
      child: ShadForm(
        key: formKey,
        child: ShadDialog(
          title: const Text('Create Knowledge Base'),
          description: const Text(
            'Provide necessary information to create a Knowledge base',
          ),
          content: Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ShadInputFormField(
                  controller: nameController,
                  placeholder: const Text('Name of Knowledge base'),
                  validator: ValidationBuilder().required().build(),
                ),
              ],
            ),
          ).hPadding,
          actions: [
            BlocConsumer<IntegrationCubit, IntegrationState>(
              listener: (context, state) {
                state.maybeWhen(
                  orElse: () {},
                  addingKnowledgeBaseFailure: (err) {
                    ShadToaster.of(context).show(
                      ShadToast.destructive(
                        title: const Text('Something Went Wrong'),
                        description: const Text(
                          'Failed to add Knowledge Base',
                        ),
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
                  addingKnowledgeBaseSuccess: (knowledgeBase) {
                    context.router.maybePop();
                    context.router.push(
                      KnowledgeBaseRoute(
                        knowledgeBase: knowledgeBase,
                      ),
                    );
                  },
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => ShadButton(
                    onPressed: () async {
                      if (formKey.currentState!.saveAndValidate()) {
                        await context
                            .read<IntegrationCubit>()
                            .createKnowledgeBase(
                              const Uuid().v4(),
                              nameController.text.trim(),
                              context.user!.uid,
                              context.orgs.first.uid,
                            );
                      }
                    },
                    text: const Text('Create'),
                  ),
                  addingKnowledgeBase: () => ShadButton(
                    enabled: false,
                    icon: const CupertinoActivityIndicator().hPaddingx(8),
                    text: const Text('Please wait...'),
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
