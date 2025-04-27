import 'package:flutter/foundation.dart';

/// Représente un prompteur de texte
@immutable
class PrompterModel {
  final String id;
  final String projectId;
  final String title;
  final String text;
  final double speed;
  final double fontSize;
  final String? password;

  const PrompterModel({
    required this.id,
    required this.projectId,
    required this.title,
    required this.text,
    required this.speed,
    this.fontSize = 24.0,
    this.password,
  });

  PrompterModel copyWith({
    String? id,
    String? projectId,
    String? title,
    String? text,
    double? speed,
    double? fontSize,
    String? password,
  }) {
    return PrompterModel(
      id: id ?? this.id,
      projectId: projectId ?? this.projectId,
      title: title ?? this.title,
      text: text ?? this.text,
      speed: speed ?? this.speed,
      fontSize: fontSize ?? this.fontSize,
      password: password ?? this.password,
    );
  }

  factory PrompterModel.fromMap(Map<String, dynamic> m) {
    return PrompterModel(
      id: m['id'] as String,
      projectId: m['projectId'] as String,
      title: m['title'] as String,
      text: m['text'] as String,
      speed: m['speed'] as double,
      fontSize: m['fontSize'] as double,
      password: m['password'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'projectId': projectId,
      'title': title,
      'text': text,
      'speed': speed,
      'fontSize': fontSize,
      'password': password,
    };
  }

  @override
  String toString() => 'PrompterModel(id: $id, title: $title)';
}
