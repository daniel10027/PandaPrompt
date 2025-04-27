import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/prompter_model.dart';
import '../services/database_service.dart';

/// Fournit et gère la liste des prompteurs dans l'app
class PrompterProvider with ChangeNotifier {
  final _db = DatabaseService();
  List<PrompterModel> _prompters = [];

  List<PrompterModel> get prompters => _prompters;

  PrompterProvider() {
    loadAllPrompters();
  }

  Future<void> loadAllPrompters() async {
    _prompters = await _db.getAllPrompters();
    notifyListeners();
  }

  Future<void> loadByProject(String projectId) async {
    _prompters = await _db.getPromptersByProject(projectId);
    notifyListeners();
  }

  Future<void> addPrompter(
    String text, {
    required String projectId,
    required String title,
    required String content,
    required double speed,
    double fontSize = 24.0,
    String? password,
  }) async {
    final p = PrompterModel(
      id: Uuid().v4(),
      projectId: projectId,
      title: title,
      text: content,
      speed: speed,
      fontSize: fontSize,
      password: password,
    );
    await _db.insertPrompter(p);
    _prompters.add(p);
    notifyListeners();
  }

  Future<void> updatePrompter(PrompterModel p) async {
    await _db.updatePrompter(p);
    final idx = _prompters.indexWhere((m) => m.id == p.id);
    if (idx >= 0) {
      _prompters[idx] = p;
      notifyListeners();
    }
  }

  Future<void> deletePrompter(String id) async {
    await _db.deletePrompter(id);
    _prompters.removeWhere((m) => m.id == id);
    notifyListeners();
  }
}
