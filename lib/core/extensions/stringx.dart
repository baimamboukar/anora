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
}
