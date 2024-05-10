TODO: remove
      WidgetsFlutterBinding.ensureInitialized();
      runZonedGuarded(() async {
        await initApp();
        configureDependencies(
          dio: ApiUtil.initApiService(apiEndpoint: dotenv.env['API_ENDPOINT']),
        );
        await LocalDatabase.init();
        runApp(const App());
      }, (error, stackTrace) async {
        await CrashlyticsApp.logError(
          'Error when init App : $error',
          stackTrace: stackTrace,
          fatal: true,
        );
      });

      Future<void> initApp() async {
        await dotenv.load();
        final firebaseApp = await Firebase.initializeApp(
          name: DefaultFirebaseOptions.name,
          options: DefaultFirebaseOptions.currentPlatform,
        );
        Routes.configureRoutes();
      
        firebaseApp.setAutomaticDataCollectionEnabled(true);
        EasyLoading.instance
          ..displayDuration = const Duration(milliseconds: 2000)
          ..indicatorType = EasyLoadingIndicatorType.fadingCircle
          ..loadingStyle = EasyLoadingStyle.light
          ..indicatorSize = 45.0
          ..radius = 10.0
          ..userInteractions = true
          ..dismissOnTap = false;
        try {
          await SharedPreferencesHelper.instance.init();
          await RemoteConfigApp.init();
          await AnalyticsApp.init(firebaseApp: firebaseApp);
          await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
        } catch (e) {
          log(e.toString())
        }
      }
      //Material app
      GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      supportedLocales: S.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: EasyLoading.init(builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child!,
        );
      }),
      home: const Container(),
      onGenerateRoute: Routes.router.generator,
      theme: ThemeData(
        primarySwatch: Colors.red,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        // fontFamily: FontFamily.beVietNamPro,
      ),
      