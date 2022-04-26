import 'package:flutter/material.dart';

class FScreen extends StatelessWidget {
  const FScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String p = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(child: Container(child: Text(p))),
      ),
    );
  }
}
