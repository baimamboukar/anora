// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:anora/src/app/assets.dart';

class Integration {
  final String title;
  final String desc;
  final String icon;
  final bool integrated;
  final bool authorized;
  Integration({
    required this.title,
    required this.desc,
    required this.icon,
    required this.integrated,
    required this.authorized,
  });
}

final integrations = <Integration>[
  Integration(
    authorized: true,
    integrated: true,
    title: 'Drive',
    desc: 'Google Drive',
    icon: Assets.assetsIconsDrive,
  ),
  Integration(
    authorized: true,
    integrated: true,
    title: 'PDF',
    desc: 'PDF Documents',
    icon: Assets.assetsIconsPdf,
  ),
  Integration(
    authorized: false,
    integrated: false,
    title: 'Slack',
    desc: 'Workspace',
    icon: Assets.assetsIconsSlack,
  ),
  Integration(
    authorized: true,
    integrated: true,
    title: 'Wikipedia',
    desc: 'Web Data',
    icon: Assets.assetsIconsWidkipedia,
  ),
];
