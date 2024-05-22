// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:anora/app/features/auth/data/models/space_models.dart';

class AnoraSpace {
  final String name;
  final String logo;
  final String uid;
  final bool verified;
  final String industry;
  final String desc;
  final bool premium;
  final List<SpaceIntegration> integrations;
  final List<SpaceKnowledgeBase> knowledges;
  final List<SpaceMember> members;
  AnoraSpace({
    required this.name,
    required this.logo,
    required this.uid,
    required this.verified,
    required this.industry,
    required this.desc,
    required this.premium,
    required this.integrations,
    required this.knowledges,
    required this.members,
  });

  @override
  String toString() {
    return 'AnoraSpace(name: $name, logo: $logo, uid: $uid, verified: $verified, industry: $industry, desc: $desc, premium: $premium, integrations: $integrations, knowledges: $knowledges, members: $members)';
  }

  AnoraSpace copyWith({
    String? name,
    String? logo,
    String? uid,
    bool? verified,
    String? industry,
    String? desc,
    bool? premium,
    List<SpaceIntegration>? integrations,
    List<SpaceKnowledgeBase>? knowledges,
    List<SpaceMember>? members,
  }) {
    return AnoraSpace(
      name: name ?? this.name,
      logo: logo ?? this.logo,
      uid: uid ?? this.uid,
      verified: verified ?? this.verified,
      industry: industry ?? this.industry,
      desc: desc ?? this.desc,
      premium: premium ?? this.premium,
      integrations: integrations ?? this.integrations,
      knowledges: knowledges ?? this.knowledges,
      members: members ?? this.members,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'logo': logo,
      'uid': uid,
      'verified': verified,
      'industry': industry,
      'desc': desc,
      'premium': premium,
      'integrations': integrations.map((x) => x.toMap()).toList(),
      'knowledges': knowledges.map((x) => x.toMap()).toList(),
      'members': members.map((x) => x.toMap()).toList(),
    };
  }

  factory AnoraSpace.fromMap(Map<String, dynamic> map) {
    return AnoraSpace(
      name: (map['name'] ?? '') as String,
      logo: (map['logo'] ?? '') as String,
      uid: (map['uid'] ?? '') as String,
      verified: (map['verified'] ?? false) as bool,
      industry: (map['industry'] ?? '') as String,
      desc: (map['desc'] ?? '') as String,
      premium: (map['premium'] ?? false) as bool,
      integrations: List<SpaceIntegration>.from(
        (map['integrations'] as List).map<SpaceIntegration>(
          (x) => SpaceIntegration.fromMap(x as Map<String, dynamic>),
        ),
      ),
      knowledges: List<SpaceKnowledgeBase>.from(
        (map['knowledges'] as List).map<SpaceKnowledgeBase>(
          (x) => SpaceKnowledgeBase.fromMap(x as Map<String, dynamic>),
        ),
      ),
      members: List<SpaceMember>.from(
        (map['members'] as List).map<SpaceMember>(
          (x) => SpaceMember.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnoraSpace.fromJson(String source) =>
      AnoraSpace.fromMap(json.decode(source) as Map<String, dynamic>);
}
