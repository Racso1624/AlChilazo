import 'package:al_chilazo/pantalla_prueba.dart';
import 'package:flutter/material.dart';

import './pantalla_prueba.dart';

class ServiceButton extends StatelessWidget {
  void selectNewPage(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return pantalla_prueba();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectNewPage(context),
    );
  }
}
