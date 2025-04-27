// lib/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/project_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prov = context.watch<ProjectProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('Paramètres')),
      body: ListView(padding: EdgeInsets.all(16), children: [
        SwitchListTile(
          title: Text('Mode sombre'),
          value: prov.isDarkMode,
          onChanged: prov.toggleDarkMode,
          secondary: Icon(Icons.dark_mode),
        ),
        SizedBox(height: 24),
        ListTile(
          leading: Icon(Icons.delete_forever, color: Colors.red),
          title: Text('Supprimer tous les projets',
              style: TextStyle(color: Colors.red)),
          onTap: prov.clearAllProjects,
        ),
      ]),
    );
  }
}
