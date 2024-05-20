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
  final DateTime on;
  Invitation({
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
    String? role,
  }) {
    return Invitation(
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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'from': from.toMap(),
      'to': to
          .map(
            (x) => x.toMap(),
          )
          .toList(),
      'organization': organization,
      'subject': subject,
      'html': text,
      'uid': uid,
      'on': on.millisecondsSinceEpoch,
      'role': role,
    };
  }

  factory Invitation.fromMap(Map<String, dynamic> map) {
    return Invitation(
      role: (map['role'] ?? '') as String,
      from: From.fromMap(map['from'] as Map<String, dynamic>),
      to: List<To>.from(
        (map['to'] as List).map<To>(
          (x) => To.fromMap(x as Map<String, dynamic>),
        ),
      ),
      organization: (map['organization'] ?? '') as String,
      subject: (map['subject'] ?? '') as String,
      text: (map['text'] ?? '') as String,
      uid: (map['uid'] ?? '') as String,
      on: DateTime.fromMillisecondsSinceEpoch((map['on'] ?? 0) as int),
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
