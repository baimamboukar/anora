// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:anora/app/features/auth/data/models/invitation_model.dart'
    as _i20;
import 'package:anora/app/features/auth/presentation/pages/login_page.dart'
    as _i9;
import 'package:anora/app/features/auth/presentation/pages/signup_page.dart'
    as _i14;
import 'package:anora/app/features/base/presentation/pages/chat_page.dart'
    as _i3;
import 'package:anora/app/features/base/presentation/pages/home_page.dart'
    as _i7;
import 'package:anora/app/features/base/presentation/pages/profile.dart'
    as _i12;
import 'package:anora/app/features/base/presentation/pages/root.dart' as _i13;
import 'package:anora/app/features/chat/logic/models/anora_prompt.dart' as _i17;
import 'package:anora/app/features/chat/ui/pages/chatroom_page.dart' as _i4;
import 'package:anora/app/features/settings/presentation/pages/advanced_configs_page.dart'
    as _i1;
import 'package:anora/app/features/settings/presentation/pages/appearance_config_page.dart'
    as _i2;
import 'package:anora/app/features/settings/presentation/pages/chats_config_page.dart'
    as _i5;
import 'package:anora/app/features/settings/presentation/pages/downloads_config_page.dart'
    as _i6;
import 'package:anora/app/features/settings/presentation/pages/language_config_page.dart'
    as _i8;
import 'package:anora/app/features/settings/presentation/pages/member_details_page.dart'
    as _i10;
import 'package:anora/app/features/settings/presentation/pages/notifications_config_page.dart'
    as _i11;
import 'package:anora/app/features/settings/presentation/pages/space_config_page.dart'
    as _i15;
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/cupertino.dart' as _i19;
import 'package:flutter/material.dart' as _i18;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    AdvancedConfigsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdvancedConfigsPage(),
      );
    },
    ApperanceConfigRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ApperanceConfigPage(),
      );
    },
    ChatRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.WrappedRoute(child: const _i3.ChatPage()),
      );
    },
    ChatroomRoute.name: (routeData) {
      final args = routeData.argsAs<ChatroomRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.WrappedRoute(
            child: _i4.ChatroomPage(
          prompt: args.prompt,
          key: args.key,
        )),
      );
    },
    ChatsConfigRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ChatsConfigPage(),
      );
    },
    DownloadsConfigRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.DownloadsConfigPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.WrappedRoute(child: const _i7.HomePage()),
      );
    },
    LanguageConfigRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.LanguageConfigPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.WrappedRoute(child: const _i9.LoginPage()),
      );
    },
    MemberDetailsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.MemberDetailsPage(),
      );
    },
    NotificationsConfigRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.NotificationsConfigPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.WrappedRoute(child: const _i12.ProfilePage()),
      );
    },
    RootRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.RootPage(),
      );
    },
    SignupRoute.name: (routeData) {
      final args = routeData.argsAs<SignupRouteArgs>(
          orElse: () => const SignupRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.WrappedRoute(
            child: _i14.SignupPage(
          key: args.key,
          invitation: args.invitation,
        )),
      );
    },
    SpaceRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.WrappedRoute(child: const _i15.SpacePage()),
      );
    },
  };
}

/// generated route for
/// [_i1.AdvancedConfigsPage]
class AdvancedConfigsRoute extends _i16.PageRouteInfo<void> {
  const AdvancedConfigsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AdvancedConfigsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdvancedConfigsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ApperanceConfigPage]
class ApperanceConfigRoute extends _i16.PageRouteInfo<void> {
  const ApperanceConfigRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ApperanceConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'ApperanceConfigRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ChatPage]
class ChatRoute extends _i16.PageRouteInfo<void> {
  const ChatRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ChatRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ChatroomPage]
class ChatroomRoute extends _i16.PageRouteInfo<ChatroomRouteArgs> {
  ChatroomRoute({
    required _i17.Prompt prompt,
    _i18.Key? key,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          ChatroomRoute.name,
          args: ChatroomRouteArgs(
            prompt: prompt,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ChatroomRoute';

  static const _i16.PageInfo<ChatroomRouteArgs> page =
      _i16.PageInfo<ChatroomRouteArgs>(name);
}

class ChatroomRouteArgs {
  const ChatroomRouteArgs({
    required this.prompt,
    this.key,
  });

  final _i17.Prompt prompt;

  final _i18.Key? key;

  @override
  String toString() {
    return 'ChatroomRouteArgs{prompt: $prompt, key: $key}';
  }
}

/// generated route for
/// [_i5.ChatsConfigPage]
class ChatsConfigRoute extends _i16.PageRouteInfo<void> {
  const ChatsConfigRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ChatsConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChatsConfigRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.DownloadsConfigPage]
class DownloadsConfigRoute extends _i16.PageRouteInfo<void> {
  const DownloadsConfigRoute({List<_i16.PageRouteInfo>? children})
      : super(
          DownloadsConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'DownloadsConfigRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomePage]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.LanguageConfigPage]
class LanguageConfigRoute extends _i16.PageRouteInfo<void> {
  const LanguageConfigRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LanguageConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'LanguageConfigRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginPage]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.MemberDetailsPage]
class MemberDetailsRoute extends _i16.PageRouteInfo<void> {
  const MemberDetailsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          MemberDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'MemberDetailsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.NotificationsConfigPage]
class NotificationsConfigRoute extends _i16.PageRouteInfo<void> {
  const NotificationsConfigRoute({List<_i16.PageRouteInfo>? children})
      : super(
          NotificationsConfigRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsConfigRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ProfilePage]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.RootPage]
class RootRoute extends _i16.PageRouteInfo<void> {
  const RootRoute({List<_i16.PageRouteInfo>? children})
      : super(
          RootRoute.name,
          initialChildren: children,
        );

  static const String name = 'RootRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SignupPage]
class SignupRoute extends _i16.PageRouteInfo<SignupRouteArgs> {
  SignupRoute({
    _i19.Key? key,
    _i20.Invitation? invitation,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          SignupRoute.name,
          args: SignupRouteArgs(
            key: key,
            invitation: invitation,
          ),
          initialChildren: children,
        );

  static const String name = 'SignupRoute';

  static const _i16.PageInfo<SignupRouteArgs> page =
      _i16.PageInfo<SignupRouteArgs>(name);
}

class SignupRouteArgs {
  const SignupRouteArgs({
    this.key,
    this.invitation,
  });

  final _i19.Key? key;

  final _i20.Invitation? invitation;

  @override
  String toString() {
    return 'SignupRouteArgs{key: $key, invitation: $invitation}';
  }
}

/// generated route for
/// [_i15.SpacePage]
class SpaceRoute extends _i16.PageRouteInfo<void> {
  const SpaceRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SpaceRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpaceRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
