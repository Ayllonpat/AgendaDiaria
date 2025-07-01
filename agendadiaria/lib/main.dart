import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/agenda_provider.dart';
import 'screens/agenda_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AgendaProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Agenda Diaria',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: const AgendaScreen(),
      ),
    );
  }
}
