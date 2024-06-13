import 'package:anora/app/features/auth/data/models/space_models.dart';
import 'package:anora/app/features/auth/domain/auth_cubit/auth_cubit.dart';
import 'package:anora/app/features/integrations/logic/integration_cubit.dart';
import 'package:anora/app/features/knowledgebases/logic/knowledgebase_cubit.dart';
import 'package:anora/core/core.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';

@RoutePage()
class KnowledgeBasePage extends StatefulWidget implements AutoRouteWrapper {
  const KnowledgeBasePage({required this.knowledgeBase, super.key});
  final SpaceKnowledgeBase knowledgeBase;

  @override
  State<KnowledgeBasePage> createState() => _KnowledgeBasePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<IntegrationCubit>(
          create: (context) => IntegrationCubit(),
        ),
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
        ),
        BlocProvider<KnowledgebaseCubit>(
          create: (context) => KnowledgebaseCubit(),
        ),
      ],
      child: this,
    );
  }
}

class _KnowledgeBasePageState extends State<KnowledgeBasePage> {
  @override
  void initState() {
    super.initState();
    context.read<KnowledgebaseCubit>().getDataSources();
  }

  @override
  Widget build(BuildContext context) {
    return AnoraPage(
      appBar: AppBar(
        title: Text(widget.knowledgeBase.name),
      ),
      child: Column(
        children: [
          Text(
            'This **knowledge base** may contain **unstructured** data from a simple image to an excel file.',
            style: context.desc,
          ).format,
          14.vGap,
          const DataSourceList(),
        ],
      ),
    );
  }
}

class DataSourceList extends StatelessWidget {
  const DataSourceList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KnowledgebaseCubit, KnowledgebaseState>(
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          gettingDataSource: () {
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
          addingDataFailed: (err) {
            // failure in red and action to retry
            return const Text(
              'Failed to get Knowledge Bases',
              style: TextStyle(color: Colors.red),
            );
          },
          gettingDataSourceSuccess: (sources) {
            return sources.isEmpty
                ? const Text('No Data source Found for This knowledge base')
                    .vPaddingx(28)
                : Column(
                    children: sources
                        .map(
                          (source) => ListTile(
                            leading: const HeroIcon(HeroIcons.folder),
                            title: Text(
                              source.details.sourceName,
                              style: context.title,
                            ),
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
