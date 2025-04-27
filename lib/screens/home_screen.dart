// lib/screens/home_screen.dart
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget _buildTile(
      BuildContext ctx, IconData icon, String label, String route) {
    return InkWell(
      onTap: () => Navigator.pushNamed(ctx, route),
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(ctx).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: Theme.of(ctx).primaryColor),
            SizedBox(height: 12),
            Text(label,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tiles = [
      [Icons.folder, 'Mes Projets', '/projects'],
      [Icons.play_circle_fill, 'Prompt Rapide', '/createPrompter'],
      [Icons.settings, 'Paramètres', '/settings'],
      [Icons.layers, 'Flottant', '/overlayReader'],
    ];
    return Scaffold(
      appBar: AppBar(title: Text('Tableau de bord')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: tiles
              .map((t) => _buildTile(
                  context, t[0] as IconData, t[1] as String, t[2] as String))
              .toList(),
        ),
      ),
    );
  }
}
