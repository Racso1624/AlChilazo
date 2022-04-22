import 'package:alchilazo/services_screen.dart';
import 'package:flutter/material.dart';

class RegisterWorker extends StatefulWidget {
  const RegisterWorker({Key? key}) : super(key: key);

  @override
  State<RegisterWorker> createState() => _MyRegisterWorkerState();
}

class _MyRegisterWorkerState extends State<RegisterWorker> {
  int _activeStepIndex = 0;

  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController foto_dpi = TextEditingController();
  TextEditingController antecedente_penal = TextEditingController();
  TextEditingController foto_perfil = TextEditingController();

  List<Step> stepList() => [
        Step(
            state:
                _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 0,
            title: const Text('Datos'),
            content: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: address,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Dirección fiscal'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: phone,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Número telefónico'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: descripcion,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Descripcion del Trabajo que Realiza'),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            )),
        Step(
            state:
                _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 1,
            title: const Text('Subir Documentos'),
            content: Column(
              children: [
                TextField(
                  controller: foto_perfil,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Foto perfil'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: antecedente_penal,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: ' Foto Antecedentes Penales'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: foto_dpi,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Foto DPI'),
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            )),
        Step(
            state: StepState.complete,
            isActive: _activeStepIndex >= 2,
            title: const Text('Confirmar'),
            content: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Dirección Fiscal: ${address.text}'),
                  Text('Número telefónico: ${phone.text}'),
                  Text('Descripcion: ${descripcion.text}'),
                  Text('Foto_perfil: ${foto_perfil.text}'),
                  Text('Foto Antecedente penales: ${antecedente_penal.text}'),
                  Text('Foto DPI: ${foto_dpi.text}')
                ],
              ),
            ))
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Registro Trabajador'),
        ),
        backgroundColor: Colors.red,
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _activeStepIndex,
        steps: stepList(),
        onStepContinue: () {
          if (_activeStepIndex < (stepList().length - 1)) {
            _activeStepIndex += 1;
          }
          setState(() {});
        },
        onStepCancel: () {
          if (_activeStepIndex == 0) {
            return;
          }
          _activeStepIndex -= 1;
          setState(() {});
        },
      ),
    );
  }
}
