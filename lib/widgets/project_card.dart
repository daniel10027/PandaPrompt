// lib/widgets/project_card.dart
import 'package:flutter/material.dart';
import '../models/project_model.dart';

/// Carte stylée pour afficher un projet dans la liste
class ProjectCard extends StatelessWidget {
  final ProjectModel project;
  final VoidCallback? onTap;

  const ProjectCard({
    Key? key,
    required this.project,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: ListTile(
        onTap: onTap,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(
          project.name,
          style: Theme.of(context)
              .textTheme
              .subtitle1
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        trailing: project.password != null
            ? Icon(Icons.lock, size: 20, color: Colors.grey[600])
            : Icon(Icons.folder_open, size: 20, color: Colors.grey[600]),
      ),
    );
  }
}
