import 'dart:collection';
import 'dart:io';

import 'algoritmo_shunting_yard.dart';
import 'stack.dart';

class OperationLenguajes {
  String? alfabeto;
  int? a;
  Map<String, List<String>> lenguajes = {};
  Map<String, List<String>> copiaLenguajes = {};

  OperationLenguajes();
  String? InputData(String alfabeto, List l, String operacion) {
    print(alfabeto);
    print(l);
    print(operacion);
    alfabeto.replaceAll(',', '');
    String alfabeto2 = '';

    for (var i = 0; i < alfabeto.length; i++) {
      if (alfabeto.substring(i, i + 1) == '/') {
        alfabeto2 += '\/';
      } else {
        alfabeto2 += alfabeto.substring(i, i + 1);
      }
    }
    this.alfabeto = alfabeto2;

    alfabeto = alfabeto2;

    for (var i = 0; i < l.length; i++) {
      String LG = l[i];

      List<String> ArregloLg = LG.split(',');

      if (EvaluacionLenguaje(ArregloLg)) {
        print(EvaluacionLenguaje(LG.split(',')));
        lenguajes['L${i + 1}'] = ArregloLg;
        copiaLenguajes['L${i + 1}'] = ArregloLg;
        print(lenguajes);
      } else {
        print('Error en el alfabeto del lenguaje');
        break;
      }
    }

    return DetectorOperaciones(lenguajes, operacion);
  }

  bool EvaluacionLenguaje(List Lenguaje) {
    for (var c = 0; c < Lenguaje.length; c++) {
      RegExp regExp = RegExp('^[$alfabeto]+\$');

      if (!regExp.hasMatch(Lenguaje[c])) {
        return false;
      }
    }
    return true;
  }

  String? DetectorOperaciones(Map Lenguajes, String Operacion) {
    List<String> A = [];
    for (var i = 0; i < Operacion.length; i++) {
      if (Operacion.substring(i, i + 1) == 'L') {
        String L = Operacion.substring(i, i + 2);
        i = i + 1;
        A.add(L);
      } else {
        A.add(Operacion.substring(i, i + 1));
      }
    }

    final f = ShuntingYard(A);
    print(f.prefi);

    prefija = f.prefi;

    List<String>? L = rpn();
    print(L);
    return L.toString();

//Δ
  }

//
//
  //  (L1U(L2UL3))Δ(L2n(L2*(L3*L2)))
  //]

  Operaciones(String op, String a, {String d = ''}) {
    switch (op) {
      case 'U':
        return UnionOperacion(lenguajes[a]!, lenguajes[d]!);

      case '°':
        return InterseccionOperacion(lenguajes[a]!, lenguajes[d]!);

      case '-':
        return DiferenciaOperacion(lenguajes[a]!, lenguajes[d]!);
      case 'Δ':
        return DiferenciaSimetricaOperacion(lenguajes[a]!, lenguajes[d]!);

      case '~':
        return ComplementoOperacion(copiaLenguajes, lenguajes[a]!);

      case '*':
        return ProductoOperacion(lenguajes[a]!, lenguajes[d]!);

      default:
    }

    return <String>[];
  }

  UnionOperacion(List<String> L1, List<String> L2) {
    List<String> Unica = [...L1, ...L2].toSet().toList();

    print('uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu');

    print(Unica);
    print('uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu');

    return Unica;
  }

  InterseccionOperacion(List<String> L1, List<String> L2) {
    List<String> f = [];

    for (var i = 0; i < L1.length; i++) {
      for (var j = 0; j < L2.length; j++) {
        if (L1[i] == L2[j]) {
          f.add(L1[i]);
        }
      }
    }

    return f;
  }

  DiferenciaOperacion(List<String> L1, List<String> L2) {
    List<String> a = [...L1];

    print('aaaaaaaaaaaaaaaaaaaaaaaaaaa');
    print(a);
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    for (var i = 0; i < L2.length; i++) {
      a.remove(L2[i]);
    }

    return a;
  }

  DiferenciaSimetricaOperacion(List<String> L1, List<String> L2) {
    List<String> f = [];

    List<String> a = [...L1];
    List<String> b = [...L2];

    List<String> L1Copia = [...L1];
    List<String> L2Copia = [...L2];
    for (var i = 0; i < b.length; i++) {
      L1Copia.remove(b[i]);
    }

    for (var i = 0; i < a.length; i++) {
      L2Copia.remove(a[i]);
    }
    f = [...L1Copia, ...L2Copia];

    return f;
  }

  ComplementoOperacion(Map<String, List<String>> lenguajes, List<String> L1) {
    List<String> f = [];

    copiaLenguajes.forEach((key, value) {
      f.addAll(value);
    });

    f = f.toSet().toList();

    print('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
    print(f);
    print('LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL');
    print(L1);

    print('...........................................');

    List s = DiferenciaOperacion(f, L1);

    print('ooooooooooooooooooooooooooooooooooooo');
    print(s);
    print('ooooooooooooooooooooooooooooooooooooo');

    return s;
  }

  ProductoOperacion(List<String> L1, List<String> L2) {
    List<String> f = [];

    for (var i = 0; i < L1.length; i++) {
      for (var j = 0; j < L2.length; j++) {
        f.add(L1[i] + L2[j]);
      }
    }

    return f;
  }

  Queue<String>? prefija;
  Stack<String> pila = Stack();

  List<String>? rpn() {
    String eleDer = '', eleIzq;

    for (var token in prefija!) {
      if (RegExp('[U°Δ~*]').hasMatch(token) || token == '-') {
        if (token != '~') {
          eleDer = pila.pop();
        }
        eleIzq = pila.pop();

        String r = '$eleIzq$token$eleDer';
        lenguajes['$eleIzq$token$eleDer'] =
            Operaciones('$token', '$eleIzq', d: '$eleDer');
        print('---------------------------------------------------');
        print('$eleIzq$token$eleDer' +
            ': ' +
            '${lenguajes['$eleIzq$token$eleDer']}');

        pila.push(r);
      } else {
        pila.push(token);
      }
    }

    return lenguajes[pila.pop()];
  }
}
