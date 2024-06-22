import 'package:anora/src/app/assets.dart';

extension StringsX on String {
  String get toOrganizationName {
    final splitted = contains(' ') ? split(' ').first : trim();
    final attritubed = "$splitted's Space";
    return attritubed;
  }

  String get toIndustryDisplayName {
    return switch (this) {
      'TECH' => 'Technologies',
      'COMMUNITY-MANAGEMENT' => 'Community Management',
      'TECHNICAL-WRITING' => 'Technical Writing',
      'HEALTHCARE' => 'Healthcare',
      'EDUCATION' => 'Education',
      'CUSTOMER-SERVICE' => 'Customer Service',
      'FINANCE' => 'Finance',
      'E-COMMERCE' => 'E-commerce',
      'HUMAN-RESOURCES' => 'Human Resources',
      'TRAVEL' => 'Travel',
      'REAL-ESTATE' => 'Real Estate',
      'LEGAL' => 'Legal',
      'MARKETING' => 'Marketing',
      'OTHER' => 'Other',
      _ => 'Industry'
    };
  }

  String get toExtension => split('.').last;

  String get iconify {
    return switch (this) {
      'pdf' => Assets.assetsIconsPdf,
      'xls' => Assets.assetsIconsExcel,
      'xlsx' => Assets.assetsIconsExcel,
      'txt' => Assets.assetsIconsDocx,
      'doc' => Assets.assetsIconsDocx,
      'docx' => Assets.assetsIconsDocx,
      'jpg' || 'png' || 'jpeg' => Assets.assetsIconsJpg,
      _ => Assets.assetsIconsPdf
    };
  }

  String get mimeType {
    final extension = split('.').last.toLowerCase();
    switch (extension) {
      case 'xls':
        return 'application/vnd.ms-excel';
      case 'xlsx':
        return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
      case 'pdf':
        return 'application/pdf';
      case 'txt':
        return 'text/plain';
      case 'jpeg':
      case 'jpg':
        return 'image/jpeg';
      case 'png':
        return 'image/png';
      case 'gif':
        return 'image/gif';
      case 'bmp':
        return 'image/bmp';
      case 'webp':
        return 'image/webp';
      case 'svg':
        return 'image/svg+xml';
      default:
        return 'application/octet-stream'; // Default MIME type for unknown extensions
    }
  }
}
