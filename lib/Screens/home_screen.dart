import 'package:flutter/material.dart';
import 'package:operations_languages/Widgets/card_container.dart';
import '../Ui/input_decorations.dart';
import '../headers/header_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            leading: Builder(
          builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.subject,
                size: 50,
                color: Colors.black,
              )),
        )),
        drawer: Drawer(),
        body: _Components(size: size));
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
      Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: Color.fromARGB(234, 55, 13, 133)),
        height: size.height * 0.4,
        width: double.infinity,
      ),
      Positioned(
        top: size.height * 0.05,
        left: size.width * 0.30,
        child: const SizedBox(
          height: 150,
          width: 150,
          child: Image(
            image: AssetImage('assets/interseccion.png'),
          ),
        ),
      ),
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
    int c = 0;
    String alfabeto = '';
    return Form(
      child: Column(
        children: [
          TextFormField(
              autocorrect: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Introduce el alfabeto',
                prefixIcon: Icon(Icons.catching_pokemon),
              ),
              validator: (value) {},
              onChanged: (value) {
                alfabeto = value;
              }),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Cantidad lenguajes',
                prefixIcon: Icon(Icons.catching_pokemon),
              ),
              validator: (value) {},
              onChanged: (value) => {c = int.parse(value)}),
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
              Navigator.pushNamed(
                context,
                'lenguajes',
                arguments: [c, alfabeto],
              );
            },
          )
        ],
      ),
    );
  }
}
