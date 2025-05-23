# PandaPrompt

## Présentation générale

**Nom de l'application :** PandaPrompt  
**Slogan :** "Votre texte, votre rythme, votre scène."  
**Type d’application :** Application mobile Flutter  
**Plateformes cibles :** Android (d'abord), iOS (plus tard)

**Description :**  
PandaPrompt est une application mobile permettant de créer, personnaliser et lire des textes en mode prompteur, avec la possibilité d’afficher l’interface en superposition sur d’autres applications.

## Objectifs

- Offrir un prompteur gratuit, rapide et personnalisable.
- Permettre l’affichage en superposition.
- Créer des projets regroupant plusieurs prompteurs.
- Sécuriser les textes avec un mot de passe.
- Permettre la personnalisation de l’apparence et de la vitesse de défilement.
- Favoriser la créativité et la praticité.

## Fonctionnalités principales

### Accueil
- Splash Screen animé
- Accès rapide à : projets, prompteurs rapides, favoris, paramètres

### Gestion des projets
- Créer, modifier, supprimer un projet
- Mot de passe optionnel

### Gestion des prompteurs
- Créer, modifier, supprimer un prompteur
- Mise en forme : police, couleur, taille, alignement, vitesse
- Mot de passe optionnel

### Lecture du prompteur
- Défilement automatique de bas en haut
- Contrôle de la lecture en temps réel
- Mode miroir

### Superposition
- Lecture en mode superposition au-dessus d’autres apps
- Déplacement libre de la fenêtre
- Transparence ajustable

### Favoris
- Marquer un projet ou un prompteur comme favori

### Sécurité
- Protection par mot de passe

### Paramètres
- Thème clair/sombre
- Sauvegarde automatique locale
- Choix de la langue (Français/Anglais)

## Structure technique

| Composant         | Technologie                     |
|-------------------|----------------------------------|
| Frontend          | Flutter / Dart                  |
| Base de données   | SQLite (local)                   |
| Superposition     | flutter_overlay_window           |
| Notifications     | flutter_local_notifications     |
| Animations        | Lottie                           |
| Sécurité          | flutter_secure_storage           |

## Architecture du projet Flutter

```
/lib
  /screens
  /models
  /providers
  /services
  /widgets
  main.dart
/assets
/db
```

## Design UI/UX

- Design épuré
- Couleurs : fond blanc/bleu pastel, accents noirs
- Icônes et boutons doux pour rappeler l’univers "Panda"

## Contraintes techniques

- Application légère (< 30 Mo)
- Défilement fluide même avec de longs textes
- Stabilité du mode superposition
- Protection des données sensibles

## Livrables

- Code Flutter complet
- APK Android
- Charte graphique
- Screenshots pour les stores
- Vidéo de démonstration simple

---
#   P a n d a P r o m p t 
 
 
