import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/main.dart'; // Assurez-vous que le chemin d'importation est correct

void main() {
  testWidgets('Lancement de l\'application et affichage du titre',
      (WidgetTester tester) async {
    // Monte le widget principal
    await tester.pumpWidget(PandaPromptApp());
    // Laisse le temps au SplashScreen et navigation initiale
    await tester.pumpAndSettle();

    // Vérifie que le titre "PandaPrompt" est présent sur l'écran d'accueil
    expect(find.text('PandaPrompt'), findsOneWidget);
  });

  testWidgets('Navigation vers l\'écran Projets via le GridTile',
      (WidgetTester tester) async {
    await tester.pumpWidget(PandaPromptApp());
    await tester.pumpAndSettle();

    // Trouve et tape sur la tuile "Mes Projets"
    final projetsTile = find.widgetWithText(InkWell, 'Mes Projets');
    expect(projetsTile, findsOneWidget);
    await tester.tap(projetsTile);
    await tester.pumpAndSettle();

    // Vérifie que l'AppBar affiche "Mes Projets"
    expect(find.text('Mes Projets'), findsOneWidget);
  });
}
