import 'package:flutter/material.dart';

import '../Widgets/card_container.dart';

class LenguajesScreen extends StatelessWidget {
  const LenguajesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List c = ModalRoute.of(context)!.settings.arguments as List;
    List a = [];
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'resultados',
                      arguments: [c[1], a]);
                },
                icon: Icon(Icons.arrow_forward))
          ],
          centerTitle: true,
          title: Text('Lenguajes'),
        ),
        body: CardContainer(
          child: ListView.builder(
              itemCount: c[0],
              itemBuilder: (context, i) {
                a.add(i);
                return TextFormField(
                    onChanged: (value) {
                      a[i] = value;
                    },
                    autocorrect: false,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      hintText: 'Introduce el alfabeto',
                      prefixIcon: Icon(Icons.catching_pokemon),
                    ));
              }),
        ));
  }
}
