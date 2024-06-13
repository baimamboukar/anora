import 'package:anora/app/features/auth/data/models/space_models.dart';
import 'package:anora/app/features/auth/domain/auth_cubit/auth_cubit.dart';
import 'package:anora/app/features/integrations/logic/integration_cubit.dart';
import 'package:anora/app/features/knowledgebases/knowledgebase/knowledgebase_cubit.dart';
import 'package:anora/core/core.dart';
import 'package:anora/core/extensions/stringx.dart';
import 'package:anora/src/app/assets.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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

final fileListener = ValueNotifier<PlatformFile?>(null);

class _KnowledgeBasePageState extends State<KnowledgeBasePage> {
  @override
  void initState() {
    super.initState();
    context
        .read<KnowledgebaseCubit>()
        .getDataSources(widget.knowledgeBase.knowledgeID);
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
          24.vGap,
          ShadButton.outline(
            text: const Text('Add Data Source'),
            onPressed: () async => showModalBottomSheet<void>(
              showDragHandle: true,
              //side: ShadSheetSide.bottom,
              context: context,
              builder: (ctx) => SizedBox(
                width: ctx.width,
                height: ctx.height * 55,
                child: Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: fileListener,
                      builder: (ctx, file, child) {
                        return file != null
                            ? BuildUploader(
                                file: file,
                                uid: widget.knowledgeBase.knowledgeID,
                              )
                            : const BuildPicker();
                      },
                      //child: const BuildPicker(),
                    ),
                    14.vGap,
                    ShadButton.outline(
                      size: ShadButtonSize.lg,
                      icon: const ShadImage(
                        Assets.assetsIconsDrive,
                        width: 24,
                        height: 24,
                      ).hPadding,
                      text: const Text('From Drive'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildUploader extends StatelessWidget {
  const BuildUploader({
    required this.file,
    required this.uid,
    super.key,
  });
  final PlatformFile file;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPick,
      child: BlocBuilder<KnowledgebaseCubit, KnowledgebaseState>(
        builder: (context, state) {
          return state.maybeWhen(
            //initial: () => Picked(file: file, uid: contextX),
            addingData: () {
              return Column(
                children: [
                  CupertinoActivityIndicator(
                    radius: 28,
                    color: context.colorScheme.ring,
                  ),
                  const Text('Adding Data Source'),
                ],
              );
            },
            addingDataFailed: (err) {
              // failure in red and action to retry
              return const Text(
                'Failed to add Data Source',
                style: TextStyle(color: Colors.red),
              );
            },
            orElse: () {
              return Picked(file: file, uid: uid);
            },
          );
        },
      ),
    );
  }
}

class Picked extends StatelessWidget implements AutoRouteWrapper {
  const Picked({
    required this.file,
    required this.uid,
    super.key,
  });

  final PlatformFile file;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return BlocListener<KnowledgebaseCubit, KnowledgebaseState>(
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          addingDataSuccess: (data) {
            Navigator.pop(context);
            context.router.maybePop();
            fileListener.value = null;
            context.read<KnowledgebaseCubit>().getDataSources(uid);
          },
        );
      },
      child: Container(
        width: context.width * .8,
        height: 200,
        decoration: BoxDecoration(
          color: context.colorScheme.ring,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            ShadImage((file.extension ?? '').iconify),
            14.vGap,
            Text(file.name, style: context.title),
            ShadButton.outline(
              text: const Text('Save Data Source'),
              onPressed: () {
                context.read<KnowledgebaseCubit>().addDataSource(
                      file,
                      uid,
                      null,
                    );
              },
            ),
          ],
        ).hPadding.vPadding,
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(),
          child: this,
        ),
        BlocProvider<KnowledgebaseCubit>(
          create: (context) => KnowledgebaseCubit(),
          child: this,
        ),
      ],
      child: this,
    );
  }
}

class BuildPicker extends StatelessWidget {
  const BuildPicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPick,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        height: 210,
        child: DottedBorder(
          padding: const EdgeInsets.all(28),
          color: context.colorScheme.primary,
          radius: const Radius.circular(28),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeroIcon(
                HeroIcons.cloud,
                size: 40,
              ).floatC,
              8.vGap,
              Text(
                'Click here to pick a file',
                style: context.title,
              ).floatC,
              Text(
                'Allowed Extensions Include pdf, excel, text and images',
                style: context.desc,
              ).floatC,
            ],
          ).hPadding.vPadding,
        ),
      ).vPadding.hPadding,
    );
  }
}

Future<void> _onPick() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: [
      'pdf',
      'xls',
      'xlsx',
      'txt',
      'doc',
      'docx',
    ],
  );

  if (result != null) {
    // Handle file selection
    fileListener.value = result.files.single;
    // print('File selected: ${result.files.single.name}');
  } else {
    // User canceled the picker
    //print('No file selected');
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
                            leading: ShadImage(
                              source.type.iconify,
                              width: 28,
                              height: 28,
                            ),
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
