import 'package:anora/app/features/auth/data/models/invitation_model.dart';
import 'package:anora/app/features/auth/domain/auth_cubit/auth_cubit.dart';
import 'package:anora/app/features/knowledgebases/knowledgebase/knowledgebase_cubit.dart';
import 'package:anora/app/features/settings/domain/integration/integration_cubit.dart';
import 'package:anora/app/router/router.dart';
import 'package:anora/app/router/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppRouter _router;

  @override
  void initState() {
    super.initState();
    _router = AppRouter();
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
        BlocProvider<KnowledgebaseCubit>(
          create: (context) => KnowledgebaseCubit(),
        ),
      ],
      child: ShadApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router.config(
          placeholder: (context) => const Center(
            child: CupertinoActivityIndicator(),
          ),
          rebuildStackOnDeepLink: true,
          deepLinkBuilder: (link) {
            if (link.path.contains('invitation')) {
              final args = link.uri.queryParameters;
              final invitation = Invitation.fromMap(args, fromInvite: true);
              return DeepLink(
                [
                  SignupRoute(invitation: invitation),
                ],
              );
            } else {
              return DeepLink.defaultPath;
            }
          },

          //deepLinkTransformer: (uri) {},
        ),
        darkTheme: ShadThemeData(
          textTheme: ShadTextTheme(
            family: 'Gilroy',
            colorScheme: const ShadBlueColorScheme.dark(),
          ),
          brightness: Brightness.dark,
          colorScheme: const ShadGreenColorScheme.dark(),
        ),
        theme: ShadThemeData(
          textTheme: ShadTextTheme(
            family: 'Gilroy',
            colorScheme: const ShadGreenColorScheme.light(),
          ),
          brightness: Brightness.light,
          colorScheme: const ShadGreenColorScheme.light(),
        ),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
