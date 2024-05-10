import 'package:anora/app/router/router.dart';
import 'package:flutter/material.dart';
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
    return ShadApp.router(
      routerConfig: _router.config(),
      darkTheme: ShadThemeData(
        textTheme: ShadTextTheme(
          family: 'Gilroy',
          colorScheme: const ShadBlueColorScheme.dark(),
        ),
        brightness: Brightness.dark,
        colorScheme: const ShadBlueColorScheme.dark(),
      ),
      theme: ShadThemeData(
        textTheme: ShadTextTheme(
          family: 'Gilroy',
          colorScheme: const ShadBlueColorScheme.light(),
        ),
        brightness: Brightness.light,
        colorScheme: const ShadBlueColorScheme.light(),
      ),
      themeMode: ThemeMode.dark,
    );
  }
}
