// lib/screens/prompter_reader_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';
import '../models/prompter_model.dart';

class PrompterReaderScreen extends StatefulWidget {
  final PrompterModel prompter;
  PrompterReaderScreen({required this.prompter});

  @override
  _PrompterReaderScreenState createState() => _PrompterReaderScreenState();
}

class _PrompterReaderScreenState extends State<PrompterReaderScreen> {
  final _ctrl = ScrollController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
      Duration(milliseconds: (1000 / widget.prompter.speed).round()),
      (_) {
        if (_ctrl.hasClients) {
          _ctrl.jumpTo(_ctrl.offset + 1.5);
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.prompter.title)),
      body: Container(
        color: Colors.black,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: SingleChildScrollView(
            controller: _ctrl,
            child: Text(
              widget.prompter.text,
              style: TextStyle(color: Colors.white, fontSize: 24, height: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}
