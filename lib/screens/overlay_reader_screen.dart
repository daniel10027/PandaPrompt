// lib/screens/overlay_reader_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/prompter_provider.dart';
import '../services/overlay_service.dart';
import '../widgets/prompter_card.dart';

class OverlayReaderScreen extends StatelessWidget {
  const OverlayReaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prompters = context.watch<PrompterProvider>().prompters;

    return Scaffold(
      appBar: AppBar(title: Text('Lecteur Flottant')),
      body: prompters.isEmpty
          ? const Center(child: Text('Aucun prompteur créé.'))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: prompters.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) {
                final p = prompters[i];
                return PrompterCard(
                  prompter: p,
                  onTap: () => OverlayService.instance.showPrompterOverlay(p),
                );
              },
            ),
    );
  }
}
