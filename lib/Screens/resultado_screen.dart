import 'package:flutter/material.dart';
import 'package:operations_languages/Widgets/card_container.dart';
import '../Ui/input_decorations.dart';
import '../headers/header_home.dart';
import '../models/teoria.dart';

class ResultadoScreen extends StatelessWidget {
  ResultadoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(appBar: AppBar(), body: _Components(size: size));
  }
}

class _Components extends StatelessWidget {
  const _Components({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 200),
            CardContainer(
              child: Column(
                children: const [
                  SizedBox(
                    height: 30,
                  ),
                  _LoginForm(),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    ]);
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? dato = '';
    OperationLenguajes operaciones = OperationLenguajes();
    String op = '';
    List p = ModalRoute.of(context)!.settings.arguments as List;
    return Form(
      child: Column(
        children: [
          TextFormField(
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Operacion',
                prefixIcon: Icon(Icons.catching_pokemon),
              ),
              validator: (value) {},
              onChanged: (value) {
                op = value;
              }),
          const SizedBox(
            height: 30,
          ),
          Text(dato),
          const SizedBox(
            height: 30,
          ),
          MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Colors.grey,
            child: Text(
              'Empezar',
              style: TextStyle(color: Colors.white),
            ),
            elevation: 0,
            color: Colors.deepPurple,
            onPressed: () {
              dato = operaciones.InputData(p[0], p[1], op);

              Navigator.pushNamed(context, 'F', arguments: dato);
            },
          )
        ],
      ),
    );
  }
}
