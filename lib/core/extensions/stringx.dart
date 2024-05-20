extension StringsX on String {
  String get toOrganizationName {
    final splitted = contains(' ') ? split(' ').first : trim();
    final attritubed = "$splitted's Space";
    return attritubed;
  }
}
