import 'package:flutter/material.dart';

class pantalla_prueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'nueva pagina',
        ),
      ),
      body: Center(
        child: Text(
          'Se cambio de pagina',
        ),
      ),
    );
  }
}
