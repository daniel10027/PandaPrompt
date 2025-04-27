// lib/services/overlay_service.dart
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import '../models/prompter_model.dart';

/// Affiche le texte du prompteur en superposition sur l'écran
class OverlayService {
  OverlayService._();
  static final instance = OverlayService._();

  /// Montre un overlay persistant jusqu'à ce que l'utilisateur le ferme
  void showPrompterOverlay(PrompterModel p) {
    showOverlayNotification(
      (context) {
        return Dismissible(
          key: ValueKey(p.id),
          direction: DismissDirection.up,
          onDismissed: (_) => OverlaySupportEntry.of(context)!.dismiss(),
          child: Material(
            color: Colors.black54,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                child: Text(
                  p.text,
                  style: TextStyle(
                      color: Colors.white, fontSize: p.fontSize, height: 1.6),
                ),
              ),
            ),
          ),
        );
      },
      duration: Duration(days: 1),
    );
  }
}
