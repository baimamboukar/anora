// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:anora/app/features/auth/data/models/invitation_model.dart'
    as _i24;
import 'package:anora/app/features/auth/data/models/space_models.dart' as _i23;
import 'package:anora/app/features/auth/presentation/pages/login_page.dart'
    as _i11;
import 'package:anora/app/features/auth/presentation/pages/signup_page.dart'
    as _i16;
import 'package:anora/app/features/auth/presentation/pages/welcome.dart'
    as _i18;
import 'package:anora/app/features/base/presentation/pages/chat_page.dart'
    as _i3;
import 'package:anora/app/features/base/presentation/pages/home_page.dart'
    as _i7;
import 'package:anora/app/features/base/presentation/pages/profile.dart'
    as _i14;
import 'package:anora/app/features/base/presentation/pages/root.dart' as _i15;
import 'package:anora/app/features/chat/logic/models/anora_prompt.dart' as _i20;
import 'package:anora/app/features/chat/ui/pages/chatroom_page.dart' as _i4;
import 'package:anora/app/features/integrations/ui/pages/integration_type.dart'
    as _i8;
import 'package:anora/app/features/knowledgebases/ui/knowledge_base.dart'
    as _i9;
import 'package:anora/app/features/settings/data/models/integration_model.dart'
    as _i22;
import 'package:anora/app/features/settings/presentation/pages/advanced_configs_page.dart'
    as _i1;
import 'package:anora/app/features/settings/presentation/pages/appearance_config_page.dart'
    as _i2;
import 'package:anora/app/features/settings/presentation/pages/chats_config_page.dart'
    as _i5;
import 'package:anora/app/features/settings/presentation/pages/downloads_config_page.dart'
    as _i6;
import 'package:anora/app/features/settings/presentation/pages/language_config_page.dart'
    as _i10;
import 'package:anora/app/features/settings/presentation/pages/member_details_page.dart'
    as _i12;
import 'package:anora/app/features/settings/presentation/pages/notifications_config_page.dart'
    as _i13;
import 'package:anora/app/features/settings/presentation/pages/space_config_page.dart'
    as _i17;
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/cupertino.dart' as _i21;
import 'package:flutter/material.dart' as _i25;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    AdvancedConfigsRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdvancedConfigsPage(),
      );
    },
    ApperanceConfigRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ApperanceConfigPage(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i3.ChatPage()),
      );
    },
    ChatroomRoute.name: (routeData) {
      final args = routeData.argsAs<ChatroomRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i4.ChatroomPage(
          prompt: args.prompt,
          key: args.key,
        )),
      );
    },
    ChatsConfigRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ChatsConfigPage(),
      );
    },
    DownloadsConfigRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.DownloadsConfigPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i7.HomePage()),
      );
    },
    IntegrationTypeRoute.name: (routeData) {
      final args = routeData.argsAs<IntegrationTypeRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i8.IntegrationTypePage(
          integration: args.integration,
          key: args.key,
        )),
      );
    },
    KnowledgeBaseRoute.name: (routeData) {
      final args = routeData.argsAs<KnowledgeBaseRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i9.KnowledgeBasePage(
          knowledgeBase: args.knowledgeBase,
          key: args.key,
        )),
      );
    },
    LanguageConfigRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.LanguageConfigPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i11.LoginPage()),
      );
    },
    MemberDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MemberDetailsRouteArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.MemberDetailsPage(
          member: args.member,
          key: args.key,
        ),
      );
    },
    NotificationsConfigRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.NotificationsConfigPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i14.ProfilePage()),
      );
    },
    RootRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.RootPage(),
      );
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>(
          orElse: () => const SignupRouteArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i16.SignupPage(
          key: args.key,
          invitation: args.invitation,
        )),
      );
    },
    SpaceRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i17.SpacePage()),
      );
    },
    WelcomeRoute.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.WelcomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AdvancedConfigsPage]
class AdvancedConfigsRoute extends _i19.PageRouteInfo<void> {
  const AdvancedConfigsRoute({List<_i19.PageRouteInfo>? children})
      : super(
          AdvancedConfigsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdvancedConfigsRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ApperanceConfigPage]
class ApperanceConfigRoute extends _i19.PageRouteInfo<void> {
  const ApperanceConfigRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ApperanceConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApperanceConfigRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ChatPage]
class ChatRoute extends _i19.PageRouteInfo<void> {
  const ChatRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChatroomPage]
class ChatroomRoute extends _i19.PageRouteInfo<ChatroomRouteArgs> {
  ChatroomRoute({
    required _i20.Prompt prompt,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          ChatroomRoute.name,
          args: ChatroomRouteArgs(
            prompt: prompt,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatroomRoute';

  static const _i19.PageInfo<ChatroomRouteArgs> page =
      _i19.PageInfo<ChatroomRouteArgs>(name);
}

class ChatroomRouteArgs {
  const ChatroomRouteArgs({
    required this.prompt,
    this.key,
  });

  final _i20.Prompt prompt;

  final _i21.Key? key;

  @override
  String toString() {
    return 'ChatroomRouteArgs{prompt: $prompt, key: $key}';
  }
}

/// generated route for
/// [_i5.ChatsConfigPage]
class ChatsConfigRoute extends _i19.PageRouteInfo<void> {
  const ChatsConfigRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ChatsConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatsConfigRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i6.DownloadsConfigPage]
class DownloadsConfigRoute extends _i19.PageRouteInfo<void> {
  const DownloadsConfigRoute({List<_i19.PageRouteInfo>? children})
      : super(
          DownloadsConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'DownloadsConfigRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute({List<_i19.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i8.IntegrationTypePage]
class IntegrationTypeRoute
    extends _i19.PageRouteInfo<IntegrationTypeRouteArgs> {
  IntegrationTypeRoute({
    required _i22.Integration integration,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          IntegrationTypeRoute.name,
          args: IntegrationTypeRouteArgs(
            integration: integration,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'IntegrationTypeRoute';

  static const _i19.PageInfo<IntegrationTypeRouteArgs> page =
      _i19.PageInfo<IntegrationTypeRouteArgs>(name);
}

class IntegrationTypeRouteArgs {
  const IntegrationTypeRouteArgs({
    required this.integration,
    this.key,
  });

  final _i22.Integration integration;

  final _i21.Key? key;

  @override
  String toString() {
    return 'IntegrationTypeRouteArgs{integration: $integration, key: $key}';
  }
}

/// generated route for
/// [_i9.KnowledgeBasePage]
class KnowledgeBaseRoute extends _i19.PageRouteInfo<KnowledgeBaseRouteArgs> {
  KnowledgeBaseRoute({
    required _i23.SpaceKnowledgeBase knowledgeBase,
    _i21.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          KnowledgeBaseRoute.name,
          args: KnowledgeBaseRouteArgs(
            knowledgeBase: knowledgeBase,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'KnowledgeBaseRoute';

  static const _i19.PageInfo<KnowledgeBaseRouteArgs> page =
      _i19.PageInfo<KnowledgeBaseRouteArgs>(name);
}

class KnowledgeBaseRouteArgs {
  const KnowledgeBaseRouteArgs({
    required this.knowledgeBase,
    this.key,
  });

  final _i23.SpaceKnowledgeBase knowledgeBase;

  final _i21.Key? key;

  @override
  String toString() {
    return 'KnowledgeBaseRouteArgs{knowledgeBase: $knowledgeBase, key: $key}';
  }
}

/// generated route for
/// [_i10.LanguageConfigPage]
class LanguageConfigRoute extends _i19.PageRouteInfo<void> {
  const LanguageConfigRoute({List<_i19.PageRouteInfo>? children})
      : super(
          LanguageConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageConfigRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i11.LoginPage]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute({List<_i19.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i12.MemberDetailsPage]
class MemberDetailsRoute extends _i19.PageRouteInfo<MemberDetailsRouteArgs> {
  MemberDetailsRoute({
    required _i24.Invitation member,
    _i25.Key? key,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          MemberDetailsRoute.name,
          args: MemberDetailsRouteArgs(
            member: member,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MemberDetailsRoute';

  static const _i19.PageInfo<MemberDetailsRouteArgs> page =
      _i19.PageInfo<MemberDetailsRouteArgs>(name);
}

class MemberDetailsRouteArgs {
  const MemberDetailsRouteArgs({
    required this.member,
    this.key,
  });

  final _i24.Invitation member;

  final _i25.Key? key;

  @override
  String toString() {
    return 'MemberDetailsRouteArgs{member: $member, key: $key}';
  }
}

/// generated route for
/// [_i13.NotificationsConfigPage]
class NotificationsConfigRoute extends _i19.PageRouteInfo<void> {
  const NotificationsConfigRoute({List<_i19.PageRouteInfo>? children})
      : super(
          NotificationsConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsConfigRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i14.ProfilePage]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i15.RootPage]
class RootRoute extends _i19.PageRouteInfo<void> {
  const RootRoute({List<_i19.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i16.SignupPage]
class SignupRoute extends _i19.PageRouteInfo<SignupRouteArgs> {
  SignupRoute({
    _i21.Key? key,
    _i24.Invitation? invitation,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          SignupRoute.name,
          args: SignupRouteArgs(
            key: key,
            invitation: invitation,
          ),
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i19.PageInfo<SignupRouteArgs> page =
      _i19.PageInfo<SignupRouteArgs>(name);
}

class SignupRouteArgs {
  const SignupRouteArgs({
    this.key,
    this.invitation,
  });

  final _i21.Key? key;

  final _i24.Invitation? invitation;

  @override
  String toString() {
    return 'SignupRouteArgs{key: $key, invitation: $invitation}';
  }
}

/// generated route for
/// [_i17.SpacePage]
class SpaceRoute extends _i19.PageRouteInfo<void> {
  const SpaceRoute({List<_i19.PageRouteInfo>? children})
      : super(
          SpaceRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpaceRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i18.WelcomePage]
class WelcomeRoute extends _i19.PageRouteInfo<void> {
  const WelcomeRoute({List<_i19.PageRouteInfo>? children})
      : super(
          WelcomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeRoute';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}
