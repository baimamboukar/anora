// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserOrganization {
  final String name;
  final String logo;
  final String uid;
  final bool verified;
  UserOrganization({
    required this.name,
    required this.logo,
    required this.uid,
    required this.verified,
  });

  UserOrganization copyWith({
    String? name,
    String? logo,
    String? uid,
    bool? verified,
  }) {
    return UserOrganization(
      name: name ?? this.name,
      logo: logo ?? this.logo,
      uid: uid ?? this.uid,
      verified: verified ?? this.verified,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'logo': logo,
      'uid': uid,
      'verified': verified,
    };
  }

  factory UserOrganization.fromMap(Map<String, dynamic> map) {
    return UserOrganization(
      name: (map['name'] ?? '') as String,
      logo: (map['logo'] ?? '') as String,
      uid: (map['uid'] ?? '') as String,
      verified: (map['verified'] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserOrganization.fromJson(String source) =>
      UserOrganization.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserOrganization(name: $name, logo: $logo, uid: $uid, verified: $verified)';
  }
}
