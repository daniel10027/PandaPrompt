// lib/services/database_service.dart
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/project_model.dart';
import '../models/prompter_model.dart';

/// Singleton pour gérer la base de données SQLite
class DatabaseService {
  static final DatabaseService _instance = DatabaseService._internal();
  factory DatabaseService() => _instance;
  DatabaseService._internal();

  Database? _db;
  Future<Database> get _database async {
    if (_db != null) return _db!;
    final path = join(await getDatabasesPath(), 'panda_prompt.db');
    _db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return _db!;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE projects (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        password TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE prompters (
        id TEXT PRIMARY KEY,
        projectId TEXT NOT NULL,
        title TEXT NOT NULL,
        text TEXT NOT NULL,
        speed REAL NOT NULL,
        fontSize REAL NOT NULL,
        password TEXT,
        FOREIGN KEY(projectId) REFERENCES projects(id) ON DELETE CASCADE
      )
    ''');
  }

  /// CRUD Projects
  Future<List<ProjectModel>> getAllProjects() async {
    final db = await _database;
    final rows = await db.query('projects');
    return rows.map((m) => ProjectModel.fromMap(m)).toList();
  }

  Future<void> insertProject(ProjectModel p) async {
    final db = await _database;
    await db.insert('projects', p.toMap());
  }

  Future<void> updateProject(ProjectModel p) async {
    final db = await _database;
    await db.update('projects', p.toMap(), where: 'id = ?', whereArgs: [p.id]);
  }

  Future<void> deleteProject(String id) async {
    final db = await _database;
    await db.delete('projects', where: 'id = ?', whereArgs: [id]);
  }

  /// CRUD Prompters
  Future<List<PrompterModel>> getPromptersByProject(String projectId) async {
    final db = await _database;
    final rows = await db.query(
      'prompters',
      where: 'projectId = ?',
      whereArgs: [projectId],
    );
    return rows.map((m) => PrompterModel.fromMap(m)).toList();
  }

  Future<List<PrompterModel>> getAllPrompters() async {
    final db = await _database;
    final rows = await db.query('prompters');
    return rows.map((m) => PrompterModel.fromMap(m)).toList();
  }

  Future<void> insertPrompter(PrompterModel p) async {
    final db = await _database;
    await db.insert('prompters', p.toMap());
  }

  Future<void> updatePrompter(PrompterModel p) async {
    final db = await _database;
    await db.update('prompters', p.toMap(), where: 'id = ?', whereArgs: [p.id]);
  }

  Future<void> deletePrompter(String id) async {
    final db = await _database;
    await db.delete('prompters', where: 'id = ?', whereArgs: [id]);
  }

  /// Supprime tous les projets en base
  Future<void> deleteAllProjects() async {
    final db = await _database;
    await db.delete('projects');
  }
}
