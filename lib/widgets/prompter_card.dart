// lib/widgets/prompter_card.dart
import 'package:flutter/material.dart';
import '../models/prompter_model.dart';

/// Carte stylée pour afficher un prompteur dans la liste
class PrompterCard extends StatelessWidget {
  final PrompterModel prompter;
  final VoidCallback onTap;

  const PrompterCard({
    Key? key,
    required this.prompter,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                prompter.title,
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 8),
              Text(
                prompter.text,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(height: 1.4),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${prompter.speed.toStringAsFixed(1)}×',
                    style: TextStyle(
                        color: Colors.teal[700], fontWeight: FontWeight.w600),
                  ),
                  Icon(Icons.chevron_right, color: Colors.teal),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
