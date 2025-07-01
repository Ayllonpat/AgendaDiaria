import 'package:flutter/material.dart';
import '../models/child.dart';
import '../models/event.dart';

class AgendaProvider extends ChangeNotifier {
  // Lista de hijos (datos mock)
  final List<Child> _children = [
    Child(
      id: 1,
      name: 'Martina López',
      imageUrl: 'https://randomuser.me/api/portraits/lego/1.jpg',
      color: Colors.blue,
      events: [
        Event(category: 'Alimentación', time: '09:00', description: 'Desayunó cereales.', childId: 1),
        Event(category: 'Siestas', time: '11:30', description: 'Durmió 45 minutos.', childId: 1),
        Event(category: 'Actividades', time: '10:00', description: 'Pintó con acuarelas.', childId: 1),
      ],
    ),
    Child(
      id: 2,
      name: 'Lucas López',
      imageUrl: 'https://randomuser.me/api/portraits/lego/2.jpg',
      color: Colors.green,
      events: [
        Event(category: 'Alimentación', time: '08:30', description: 'Bebió leche.', childId: 2),
        Event(category: 'Deposiciones', time: '12:15', description: 'Deposición normal.', childId: 2),
        Event(category: 'Observaciones', time: '14:00', description: 'Muy activo hoy.', childId: 2),
      ],
    ),
  ];



  int? _selectedChildId; // null = todos los hijos
  String _selectedCategory = 'Todas'; // Categoría seleccionada

  List<Child> get children => _children;

  int? get selectedChildId => _selectedChildId;
  String get selectedCategory => _selectedCategory;

  void selectChild(int? childId) {
    _selectedChildId = childId;
    notifyListeners();
  }

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  Color getChildColorById(int id) {
    try {
      final child = _children.firstWhere((child) => child.id == id);
      return child.color;
    } catch (e) {
      return Colors.grey;
    }
  }

  List<Event> get filteredEvents {
    List<Child> selectedChildren = _selectedChildId == null
        ? _children
        : _children.where((child) => child.id == _selectedChildId).toList();

    List<Event> events = [];
    for (var child in selectedChildren) {
      events.addAll(child.events.map((event) => Event(
            category: event.category,
            time: event.time,
            description: '${child.name}: ${event.description}',
            childId: child.id, // 👉 le pasas el id
          )));
    }

    if (_selectedCategory == 'Todas') return events;

    return events.where((event) => event.category == _selectedCategory).toList();
  }


}
