// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AnoraIntegration {
  AnoraIntegration({
    required this.id,
    required this.type,
    required this.details,
  });
  final String id;
  final String type;
  final IntegrationDetails details;

  AnoraIntegration copyWith({
    String? id,
    String? type,
    IntegrationDetails? details,
  }) {
    return AnoraIntegration(
      id: id ?? this.id,
      type: type ?? this.type,
      details: details ?? this.details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'details': details.toMap(),
    };
  }

  factory AnoraIntegration.fromMap(Map<String, dynamic> map) {
    return AnoraIntegration(
      id: (map['id'] ?? '') as String,
      type: (map['type'] ?? '') as String,
      details:
          IntegrationDetails.fromMap(map['details'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnoraIntegration.fromJson(String source) =>
      AnoraIntegration.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AnoraIntegration(id: $id, type: $type, details: $details)';
}

class IntegrationDetails {
  IntegrationDetails({
    required this.clientID,
    required this.clientSecret,
    required this.refreshToken,
  });
  final String clientID;
  final String clientSecret;
  final String refreshToken;

  IntegrationDetails copyWith({
    String? clientID,
    String? clientSecret,
    String? refreshToken,
  }) {
    return IntegrationDetails(
      clientID: clientID ?? this.clientID,
      clientSecret: clientSecret ?? this.clientSecret,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'clientID': clientID,
      'clientSecret': clientSecret,
      'refreshToken': refreshToken,
    };
  }

  factory IntegrationDetails.fromMap(Map<String, dynamic> map) {
    return IntegrationDetails(
      clientID: (map['clientID'] ?? '') as String,
      clientSecret: (map['clientSecret'] ?? '') as String,
      refreshToken: (map['refreshToken'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory IntegrationDetails.fromJson(String source) =>
      IntegrationDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'IntegrationDetails(clientID: $clientID, clientSecret: $clientSecret, refreshToken: $refreshToken)';
}
