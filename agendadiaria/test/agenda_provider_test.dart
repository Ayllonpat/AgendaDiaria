import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:agendadiaria/providers/agenda_provider.dart';

void main() {
  group('AgendaProvider Tests', () {
    test('getChildColorById devuelve el color correcto para cada hijo', () {
      final provider = AgendaProvider();

      final colorMartina = provider.getChildColorById(1);
      expect(colorMartina, Colors.blue);

      final colorLucas = provider.getChildColorById(2);
      expect(colorLucas, Colors.green);
    });

    test('getChildColorById devuelve gris si el id no existe', () {
      final provider = AgendaProvider();

      final colorInexistente = provider.getChildColorById(99);
      expect(colorInexistente, Colors.grey);
    });
  });
}
