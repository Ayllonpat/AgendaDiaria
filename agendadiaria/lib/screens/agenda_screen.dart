import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/agenda_provider.dart';
import '../widgets/child_selector.dart';
import '../widgets/category_selector.dart';
import '../widgets/event_card.dart';

class AgendaScreen extends StatelessWidget {
  const AgendaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AgendaProvider>(context);
    final events = provider.filteredEvents;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text(
          'Agenda diaria',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header: Nombre del padre/madre
            const Text(
              'Luis López',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Selector de hijo
            const ChildSelector(),

            const SizedBox(height: 16),

            // Selector de categorías
            const CategorySelector(),

            const SizedBox(height: 16),

            // Lista de eventos responsive
            Expanded(
              child: events.isEmpty
                  ? const Center(child: Text('No hay eventos para mostrar.'))
                  : LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 600) {
                          // Pantalla grande: Web
                          return GridView.builder(
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, 
                              childAspectRatio: 3 / 2, 
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                            ),
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              final event = events[index];
                              return EventCard(event: event);
                            },
                          );
                        } else {
                          // Pantalla pequeña: Móvil
                          return ListView.builder(
                            itemCount: events.length,
                            itemBuilder: (context, index) {
                              final event = events[index];
                              return EventCard(event: event);
                            },
                          );
                        }
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
