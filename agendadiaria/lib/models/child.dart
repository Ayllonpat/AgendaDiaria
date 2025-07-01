import 'package:flutter/material.dart';
import 'event.dart';

class Child {
  final int id;
  final String name;
  final String imageUrl;
  final Color color;
  final List<Event> events;

  Child({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.color,
    required this.events,
  });
}
