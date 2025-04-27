// lib/widgets/settings_tile.dart
import 'package:flutter/material.dart';

/// Tuile de paramètre avec titre, icône et action
class SettingsTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget trailing;
  final VoidCallback? onTap;

  const SettingsTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.trailing,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: Theme.of(context).primaryColor),
        title: Text(title, style: Theme.of(context).textTheme.bodyText1),
        trailing: trailing,
      ),
    );
  }
}
