import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/event.dart';
import '../providers/agenda_provider.dart';

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AgendaProvider>(context, listen: false);
    final iconColor = provider.getChildColorById(event.childId);

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.calendar_today, size: 40, color: iconColor),
        title: Text(event.time),
        subtitle: Text(event.description),
      ),
    );
  }
}
