// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars
import 'dart:convert';

import 'package:anora/app/features/auth/data/models/organization_model.dart';

class AnoraUser {
  final String uid;
  final String names;
  final String email;
  final String role;
  final String photo;

  final List<UserOrganization> organizations;
  AnoraUser({
    required this.uid,
    required this.names,
    required this.email,
    required this.role,
    required this.photo,
    required this.organizations,
  });

  AnoraUser copyWith({
    String? uid,
    String? names,
    String? email,
    String? role,
    String? photo,
    List<UserOrganization>? organizations,
  }) {
    return AnoraUser(
      uid: uid ?? this.uid,
      names: names ?? this.names,
      email: email ?? this.email,
      role: role ?? this.role,
      photo: photo ?? this.photo,
      organizations: organizations ?? this.organizations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'names': names,
      'email': email,
      'role': role,
      'photo': photo,
      'organizations': organizations.map((x) => x.toMap()).toList(),
    };
  }

  factory AnoraUser.fromMap(Map<String, dynamic> map) {
    return AnoraUser(
      uid: (map['uid'] ?? '') as String,
      names: (map['names'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      role: (map['role'] ?? '') as String,
      photo: (map['photo'] ?? '') as String,
      organizations: List<UserOrganization>.from(
        (map['organizations'] as List<int>).map<UserOrganization>(
          (x) => UserOrganization.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnoraUser.fromJson(String source) =>
      AnoraUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AnoraUser(uid: $uid, names: $names, email: $email, role: $role, photo: $photo, organizations: $organizations)';
  }
}
