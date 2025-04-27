// lib/screens/create_prompter_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/prompter_provider.dart';

class CreatePrompterScreen extends StatefulWidget {
  @override
  _CreatePrompterScreenState createState() => _CreatePrompterScreenState();
}

class _CreatePrompterScreenState extends State<CreatePrompterScreen> {
  final _formKey = GlobalKey<FormState>();
  String _text = '';
  double _speed = 1.0;

  @override
  Widget build(BuildContext context) {
    final prov = context.read<PrompterProvider>();
    return Scaffold(
      appBar: AppBar(title: Text('Nouveau Prompteur')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(children: [
            Expanded(
              child: TextFormField(
                maxLines: null,
                style: TextStyle(fontSize: 18),
                decoration: InputDecoration(labelText: 'Écris ton texte'),
                validator: (v) =>
                    (v == null || v.trim().isEmpty) ? 'Champ requis' : null,
                onSaved: (v) => _text = v!.trim(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Text('Vitesse :',
                    style: TextStyle(fontWeight: FontWeight.w600)),
                Expanded(
                  child: Slider(
                    min: 0.5,
                    max: 5.0,
                    divisions: 9,
                    label: '${_speed.toStringAsFixed(1)}×',
                    value: _speed,
                    onChanged: (v) => setState(() => _speed = v),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              icon: Icon(Icons.save),
              label: Text('Enregistrer'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  // Génération automatique d'un titre
                  final title = 'Prompt ${prov.prompters.length + 1}';
                  prov.addPrompter(
                    _text, // argument positionnel
                    projectId: '', // ou l'ID du projet sélectionné
                    title: title, // titre du prompter
                    content: _text, // texte à défiler
                    speed: _speed, // vitesse de défilement
                  );
                  Navigator.pop(context);
                }
              },
            ),
          ]),
        ),
      ),
    );
  }
}
