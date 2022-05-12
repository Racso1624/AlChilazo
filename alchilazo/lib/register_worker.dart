import 'package:alchilazo/mongo.dart';
import 'package:alchilazo/services_screen.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:flutter/material.dart';
import 'MongoDbModel_Worker.dart';

class RegisterWorker extends StatefulWidget {
  const RegisterWorker({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  State<RegisterWorker> createState() => _MyRegisterWorkerState();
}

class _MyRegisterWorkerState extends State<RegisterWorker> {
  int _activeStepIndex = 0;

  var address = TextEditingController();
  var phone = TextEditingController();
  var email = TextEditingController();
  var descripcion = TextEditingController();
  var foto_dpi = TextEditingController();
  var antecedente_penal = TextEditingController();
  var foto_perfil = TextEditingController();

  Future<void> _insertData(
  String name, String address, String phone, String email, String descripcion, 
  String foto_dpi, String antecedente_penal, String foto_perfil,) async {
    var _id = M.ObjectId();
    final data = MongoDbModel_Worker( 
      id: _id, name: name, address: address, phone: phone, email: email, descripcion: descripcion, 
      foto_dpi: foto_dpi, antecedente_penal: antecedente_penal, foto_perfil: foto_perfil);
    var result = await MongoDatabase.insert_worker(data);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text("INSERTED ID " + _id.$oid)));
    _clearAll();
  }

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
          else{
            _insertData(widget.name, address.text, phone.text, email.text, descripcion.text, foto_dpi.text, antecedente_penal.text, foto_perfil.text);
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

  void _clearAll() {
    address.text = '';
    phone.text = '';
    email.text = '';
    descripcion.text = '';
    foto_dpi.text = '';
    antecedente_penal.text = '';
    foto_perfil.text = '';
  }

}
