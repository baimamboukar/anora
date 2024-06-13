// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AnoraDataSource {
  AnoraDataSource({
    required this.type,
    required this.uid,
    required this.knowledgeBaseID,
    required this.details,
  });
  final String type;
  final String uid;
  final String knowledgeBaseID;
  final DataSourceDatails details;

  AnoraDataSource copyWith({
    String? type,
    String? uid,
    String? knowledgeBaseID,
    DataSourceDatails? details,
  }) {
    return AnoraDataSource(
      type: type ?? this.type,
      uid: uid ?? this.uid,
      knowledgeBaseID: knowledgeBaseID ?? this.knowledgeBaseID,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'uid': uid,
      'knowledgeBaseID': knowledgeBaseID,
      'details': details.toMap(),
    };
  }

  factory AnoraDataSource.fromMap(Map<String, dynamic> map) {
    return AnoraDataSource(
      type: (map['type'] ?? '') as String,
      uid: (map['uid'] ?? '') as String,
      knowledgeBaseID: (map['knowledgeBaseID'] ?? '') as String,
      details:
          DataSourceDatails.fromMap(map['details'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnoraDataSource.fromJson(String source) =>
      AnoraDataSource.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AnoraDataSource(type: $type, uid: $uid, knowledgeBaseID: $knowledgeBaseID, details: $details)';
  }
}

class DataSourceDatails {
  DataSourceDatails({
    required this.sourceID,
    required this.sourceURL,
    required this.sourceName,
    required this.sourceType,
    this.sourceToken,
  });
  final String sourceID;
  final String sourceURL;
  final String sourceName;
  final String? sourceToken;
  final String sourceType;
  DataSourceDatails copyWith({
    String? sourceID,
    String? sourceURL,
    String? sourceName,
    String? sourceToken,
  }) {
    return DataSourceDatails(
      sourceType: sourceType ?? sourceType,
      sourceID: sourceID ?? this.sourceID,
      sourceURL: sourceURL ?? this.sourceURL,
      sourceName: sourceName ?? this.sourceName,
      sourceToken: sourceToken ?? this.sourceToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sourceID': sourceID,
      'sourceURL': sourceURL,
      'sourceName': sourceName,
      'sourceToken': sourceToken,
    };
  }

  factory DataSourceDatails.fromMap(Map<String, dynamic> map) {
    return DataSourceDatails(
      sourceType: (map['sourceType'] ?? '') as String,
      sourceID: (map['sourceID'] ?? '') as String,
      sourceURL: (map['sourceURL'] ?? '') as String,
      sourceName: (map['sourceName'] ?? '') as String,
      sourceToken:
          map['sourceToken'] != null ? map['sourceToken'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DataSourceDatails.fromJson(String source) =>
      DataSourceDatails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DataSourceDatails(sourceID: $sourceID, sourceURL: $sourceURL, sourceName: $sourceName, sourceToken: $sourceToken)';
  }
}
