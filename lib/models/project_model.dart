import 'package:flutter/foundation.dart';

/// Représente un projet de prompteurs
@immutable
class ProjectModel {
  final String id;
  final String name;
  final String? password;

  const ProjectModel({
    required this.id,
    required this.name,
    this.password,
  });

  ProjectModel copyWith({
    String? id,
    String? name,
    String? password,
  }) {
    return ProjectModel(
      id: id ?? this.id,
      name: name ?? this.name,
      password: password ?? this.password,
    );
  }

  factory ProjectModel.fromMap(Map<String, dynamic> m) {
    return ProjectModel(
      id: m['id'] as String,
      name: m['name'] as String,
      password: m['password'] as String?,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'password': password,
    };
  }

  @override
  String toString() => 'ProjectModel(id: $id, name: $name)';
}
