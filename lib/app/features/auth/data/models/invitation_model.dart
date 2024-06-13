// ignore_for_file: parameter_assignments

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Invitation {
  final From from;
  final List<To> to;
  final String organization;
  final String subject;
  final String text;
  final String uid;
  final String role;
  final String orguid;
  final DateTime on;
  Invitation({
    required this.orguid,
    required this.from,
    required this.role,
    required this.to,
    required this.organization,
    required this.subject,
    required this.text,
    required this.uid,
    required this.on,
  });

  Invitation copyWith({
    From? from,
    List<To>? to,
    String? organization,
    String? subject,
    String? text,
    String? uid,
    DateTime? on,
    String? orguid,
    String? role,
  }) {
    return Invitation(
      orguid: orguid ?? this.orguid,
      role: role ?? this.role,
      from: from ?? this.from,
      to: to ?? this.to,
      organization: organization ?? this.organization,
      subject: subject ?? this.subject,
      text: text ?? this.text,
      uid: uid ?? this.uid,
      on: on ?? this.on,
    );
  }

  Map<String, dynamic> toMap({bool forInvite = false}) {
    return <String, dynamic>{
      'from': forInvite ? from.toMap().toString() : from.toMap(),
      'to': forInvite
          ? to
              .map(
                (x) => x.toMap().toString(),
              )
              .toList()
          : to
              .map(
                (x) => x.toMap(),
              )
              .toList(),
      'organization': organization,
      'subject': subject,
      'html': text,
      'uid': uid,
      'on': on.toIso8601String(),
      'role': role,
      'orguid': orguid,
    };
  }

  static Map<String, dynamic> _parseJsonString(String jsonString) {
    jsonString = jsonString
        .replaceAll('{', '{"')
        .replaceAll('}', '"}')
        .replaceAll(': ', '": "')
        .replaceAll(', ', '", "');
    return json.decode(jsonString) as Map<String, dynamic>;
  }

  factory Invitation.fromMap(
    Map<String, dynamic> map, {
    bool fromInvite = false,
  }) {
    var fromMap = <String, dynamic>{};
    var toMap = <String, dynamic>{};
    if (fromInvite) {
      fromMap = _parseJsonString(map['from'] as String);
      toMap = _parseJsonString(map['to'] as String);
    }

    // else {
    //   fromMap = map['from'] as Map<String, dynamic>;
    //   toMap = map['to'] as Map<String, dynamic>;
    // }
    return Invitation(
      orguid: (map['orguid'] ?? '') as String,
      role: (map['role'] ?? '') as String,
      from: fromInvite
          ? From.fromMap(fromMap)
          : From.fromMap(map['from'] as Map<String, dynamic>),
      to: fromInvite
          ? [To.fromMap(toMap)]
          : (map['to'] as List)
              .map((x) => To.fromMap(x as Map<String, dynamic>))
              .toList(),
      organization: (map['organization'] ?? '') as String,
      subject: (map['subject'] ?? '') as String,
      text: (map['text'] ?? '') as String,
      uid: (map['uid'] ?? '') as String,
      on: DateTime.parse((map['on'] ?? '') as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Invitation.fromJson(String source) =>
      Invitation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Invitation(from: $from, to: $to, organization: $organization, subject: $subject, text: $text, uid: $uid, on: $on)';
  }
}

class From {
  final String email;
  final String name;
  From({
    required this.email,
    required this.name,
  });

  From copyWith({
    String? email,
    String? name,
  }) {
    return From(
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
    };
  }

  factory From.fromMap(Map<String, dynamic> map) {
    return From(
      email: (map['email'] ?? '') as String,
      name: (map['name'] ?? '') as String,
    );
  }
}

class To {
  final String email;
  final String name;
  To({
    required this.email,
    required this.name,
  });

  To copyWith({
    String? email,
    String? name,
  }) {
    return To(
      email: email ?? this.email,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'name': name,
    };
  }

  factory To.fromMap(Map<String, dynamic> map) {
    return To(
      email: (map['email'] ?? '') as String,
      name: (map['name'] ?? '') as String,
    );
  }
}
