import 'package:flutter/material.dart';
import 'package:operations_languages/Screens/lenguajes_screen.dart';
import 'package:operations_languages/Screens/r.dart';
import 'package:operations_languages/Screens/resultado_screen.dart';

import 'Screens/screens.dart';
import 'Theme/theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'lenguajes': (_) => LenguajesScreen(),
          'resultados': (_) => ResultadoScreen(),
          'F': (_) => FScreen()
        });
  }
}
