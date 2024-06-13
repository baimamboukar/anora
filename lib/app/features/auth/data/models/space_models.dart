// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:anora/app/features/auth/data/models/anora_datasource_model.dart';

class SpaceMember {
  SpaceMember({
    required this.userID,
    required this.role,
  });
  final String userID;
  final String role;

  SpaceMember copyWith({
    String? userID,
    String? role,
  }) {
    return SpaceMember(
      userID: userID ?? this.userID,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userID': userID,
      'role': role,
    };
  }

  factory SpaceMember.fromMap(Map<String, dynamic> map) {
    return SpaceMember(
      userID: (map['userID'] ?? '') as String,
      role: (map['role'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpaceMember.fromJson(String source) =>
      SpaceMember.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SpaceMember(userID: $userID, role: $role)';
}

class SpaceIntegration {
  SpaceIntegration({
    required this.id,
    required this.type,
  });
  final String id;
  final String type;

  SpaceIntegration copyWith({
    String? id,
    String? type,
  }) {
    return SpaceIntegration(
      id: id ?? this.id,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
    };
  }

  factory SpaceIntegration.fromMap(Map<String, dynamic> map) {
    return SpaceIntegration(
      id: (map['id'] ?? '') as String,
      type: (map['type'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SpaceIntegration.fromJson(String source) =>
      SpaceIntegration.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SpaceIntegration(id: $id, type: $type)';
}

class SpaceKnowledgeBase {
  SpaceKnowledgeBase({
    required this.knowledgeID,
    required this.spaceID,
    required this.sources,
    required this.name,
  });
  final String knowledgeID;
  final String spaceID;
  final String name;
  final List<AnoraDataSource> sources;

  SpaceKnowledgeBase copyWith({
    String? knowledgeID,
    String? spaceID,
    String? name,
    List<AnoraDataSource>? sources,
  }) {
    return SpaceKnowledgeBase(
      name: name ?? this.name,
      knowledgeID: knowledgeID ?? this.knowledgeID,
      spaceID: spaceID ?? this.spaceID,
      sources: sources ?? this.sources,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'knowledgeID': knowledgeID,
      'spaceID': spaceID,
      'sources': sources.map((x) => x.toMap()).toList(),
    };
  }

  factory SpaceKnowledgeBase.fromMap(Map<String, dynamic> map) {
    return SpaceKnowledgeBase(
      name: (map['name'] ?? '') as String,
      knowledgeID: (map['knowledgeID'] ?? '') as String,
      spaceID: (map['spaceID'] ?? '') as String,
      sources: List<AnoraDataSource>.from(
        (map['sources'] as List).map<AnoraDataSource>(
          (x) => AnoraDataSource.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SpaceKnowledgeBase.fromJson(String source) =>
      SpaceKnowledgeBase.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SpaceKnowledgeBase(knowledgeID: $knowledgeID, spaceID: $spaceID, sources: $sources)';
}

class UserSpace {
  final String spaceID;
  final String role;
  UserSpace({
    required this.spaceID,
    required this.role,
  });

  UserSpace copyWith({
    String? spaceID,
    String? role,
  }) {
    return UserSpace(
      spaceID: spaceID ?? this.spaceID,
      role: role ?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'spaceID': spaceID,
      'role': role,
    };
  }

  factory UserSpace.fromMap(Map<String, dynamic> map) {
    return UserSpace(
      spaceID: (map['spaceID'] ?? '') as String,
      role: (map['role'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserSpace.fromJson(String source) =>
      UserSpace.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserSpace(spaceID: $spaceID, role: $role)';
}
