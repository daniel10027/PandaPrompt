// lib/screens/project_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/project_provider.dart';
import '../widgets/project_card.dart';
import '../models/project_model.dart';

class ProjectScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final projectProv = context.watch<ProjectProvider>();
    final projects = projectProv.projects;

    return Scaffold(
      appBar: AppBar(
        title: Text('Mes Projets'),
        centerTitle: true,
      ),
      body: projects.isEmpty
          ? Center(
              child: Text(
                'Aucun projet disponible.\nAppuie sur "+" pour en créer un.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              itemCount: projects.length,
              separatorBuilder: (_, __) => SizedBox(height: 12),
              itemBuilder: (context, index) {
                final ProjectModel project = projects[index];
                return ProjectCard(
                  project: project,
                  onTap: () {
                    // Navigue vers l'écran des prompteurs de ce projet
                    Navigator.pushNamed(
                      context,
                      '/projectDetail',
                      arguments: project,
                    );
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'addProject',
        child: Icon(Icons.add),
        tooltip: 'Nouveau projet',
        onPressed: () => projectProv.createProjectDialog(context),
      ),
    );
  }
}
