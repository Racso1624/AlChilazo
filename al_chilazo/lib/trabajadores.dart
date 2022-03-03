import 'package:flutter/material.dart';

class Trabajadores extends StatelessWidget {
  String nombres;

  Trabajadores(this.nombres);

  @override
  Widget build(BuildContext context) {
    return Text(nombres);
  }
}
