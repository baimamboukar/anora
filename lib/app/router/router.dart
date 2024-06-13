import 'package:anora/app/features/knowledgebases/ui/knowledge_base.dart';
import 'package:anora/app/router/guards/auth_guard.dart';
import 'package:anora/app/router/router.gr.dart';
import 'package:anora/app/router/router_paths.dart';
import 'package:auto_route/auto_route.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: WelcomeRoute.page,
          path: WELCOME_ROUTE,
        ),
        AutoRoute(
          page: RootRoute.page,
          path: '/',
          initial: true,
          guards: [AuthGuard()],
          children: [
            AutoRoute(
              page: HomeRoute.page,
              path: 'home',
            ),
            AutoRoute(
              page: ChatRoute.page,
              path: 'chat',
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
            ),
          ],
        ),

        /// -----CONFIGS AND SETTINGS ROUTES----- ///

        AutoRoute(page: SpaceRoute.page, path: MY_SPACE_CONFIG_ROUTE),
        AutoRoute(page: ChatsConfigRoute.page, path: CHATS_CONFIG_ROUTE),
        AutoRoute(
          page: DownloadsConfigRoute.page,
          path: DOWNLOADS_CONFIG_ROUTE,
        ),
        AutoRoute(
          page: AdvancedConfigsRoute.page,
          path: ADVANCED_CONFIGS_ROUTE,
        ),
        AutoRoute(
          page: NotificationsConfigRoute.page,
          path: NOTIFICATIONS_CONFIG_ROUTE,
        ),
        AutoRoute(
          page: LanguageConfigRoute.page,
          path: LANGUAGE_CONFIG_ROUTE,
        ),
        AutoRoute(
          page: ApperanceConfigRoute.page,
          path: APPREARANCE_CONFIG_ROUTE,
        ),
        AutoRoute(
          page: MemberDetailsRoute.page,
          path: MEMBER_DETAILS_ROUTE,
        ),

        // Auth Routes
        AutoRoute(
          page: LoginRoute.page,
          path: LOGIN_ROUTE,
        ),
        AutoRoute(
          page: SignupRoute.page,
          path: SIGNUP_ROUTE,
        ),
        // CHAT ROUTES

        AutoRoute(
          page: ChatroomRoute.page,
          path: CHAT_ROUTE,
        ),
        AutoRoute(
          page: IntegrationTypeRoute.page,
          //path: CHAT_ROUTE,
        ),
        AutoRoute(
          page: KnowledgeBaseRoute.page,
          //path: CHAT_ROUTE,
        ),
      ];
}
