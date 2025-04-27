// lib/providers/project_provider.dart

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/project_model.dart';
import '../services/database_service.dart';

class ProjectProvider with ChangeNotifier {
  final _db = DatabaseService();
  List<ProjectModel> _projects = [];
  bool _darkMode = false;

  List<ProjectModel> get projects => _projects;
  bool get isDarkMode => _darkMode;

  ProjectProvider() {
    _loadProjects();
  }

  Future<void> _loadProjects() async {
    _projects = await _db.getAllProjects();
    notifyListeners();
  }

  /// Ouvre un dialog pour créer un nouveau projet
  Future<void> createProjectDialog(BuildContext ctx) async {
    final nameCtrl = TextEditingController();
    final passCtrl = TextEditingController();

    await showDialog(
      context: ctx,
      builder: (_) => AlertDialog(
        title: Text('Nouveau projet'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(labelText: 'Nom du projet'),
            ),
            SizedBox(height: 12),
            TextField(
              controller: passCtrl,
              decoration:
                  InputDecoration(labelText: 'Mot de passe (optionnel)'),
              obscureText: true,
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(ctx), child: Text('Annuler')),
          ElevatedButton(
            onPressed: () async {
              final name = nameCtrl.text.trim();
              if (name.isEmpty) return;
              await addProject(
                name,
                password:
                    passCtrl.text.trim().isEmpty ? null : passCtrl.text.trim(),
              );
              Navigator.pop(ctx);
            },
            child: Text('Créer'),
          ),
        ],
      ),
    );
  }

  /// Ajoute un projet en base et en mémoire
  Future<void> addProject(String name, {String? password}) async {
    final project = ProjectModel(
      id: Uuid().v4(),
      name: name,
      password: password,
    );
    await _db.insertProject(project);
    _projects.add(project);
    notifyListeners();
  }

  /// Supprime tous les projets
  Future<void> clearAllProjects() async {
    await _db.deleteAllProjects();
    _projects.clear();
    notifyListeners();
  }

  /// Supprime un projet par son ID
  Future<void> deleteProject(String id) async {
    await _db.deleteProject(id);
    _projects.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  /// Bascule le thème sombre / clair
  void toggleDarkMode(bool value) {
    _darkMode = value;
    notifyListeners();
  }
}
