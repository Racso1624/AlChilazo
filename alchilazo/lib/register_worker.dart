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
  TextEditingController dpi = TextEditingController();
  TextEditingController postalCode = TextEditingController();

  List<Step> stepList() => [
        Step(
            state:
                _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
            isActive: _activeStepIndex >= 0,
            title: const Text('Datos'),
            content: Column(
              children: [
                TextField(
                  controller: name,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nombre completo'),
                ),
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
                  controller: email,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Correo Electrónico'),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: password,
                  obscureText: true,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Contraseña'),
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
            title: const Text('Documentos'),
            content: Column(
              children: [
                TextField(
                  controller: dpi,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: 'DPI'),
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
                  Text('Nombre completo: ${name.text}'),
                  Text('Dirección Fiscal: ${address.text}'),
                  Text('Número telefónico: ${phone.text}'),
                  Text('Correo Electrónico: ${email.text}'),
                  const Text('Contraseña: ******'),
                  Text('DPI: ${dpi.text}')
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
      )),
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