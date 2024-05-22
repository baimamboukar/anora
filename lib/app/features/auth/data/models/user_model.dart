// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars
import 'dart:convert';

import 'package:anora/app/features/auth/data/models/space_models.dart';

class AnoraUser {
  final String org;
  final String uid;
  final String names;
  final String email;
  final String photo;
  final List<UserSpace> organizations;
  AnoraUser({
    required this.org,
    required this.uid,
    required this.names,
    required this.email,
    required this.photo,
    required this.organizations,
  });

  AnoraUser copyWith({
    String? uid,
    String? names,
    String? email,
    String? photo,
    List<UserSpace>? organizations,
    String? org,
  }) {
    return AnoraUser(
      org: org ?? this.org,
      uid: uid ?? this.uid,
      names: names ?? this.names,
      email: email ?? this.email,
      photo: photo ?? this.photo,
      organizations: organizations ?? this.organizations,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'names': names,
      'email': email,
      'photo': photo,
      'org': org,
      'organizations': organizations.map((x) => x.toMap()).toList(),
    };
  }

  factory AnoraUser.fromMap(Map<String, dynamic> map) {
    return AnoraUser(
      org: (map['org'] ?? '') as String,
      uid: (map['uid'] ?? '') as String,
      names: (map['names'] ?? '') as String,
      email: (map['email'] ?? '') as String,
      photo: (map['photo'] ?? '') as String,
      organizations: List<UserSpace>.from(
        (map['organizations'] as List).map<UserSpace>(
          (x) => UserSpace.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnoraUser.fromJson(String source) =>
      AnoraUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AnoraUser(uid: $uid, names: $names, email: $email, photo: $photo, organizations: $organizations)';
  }
}
