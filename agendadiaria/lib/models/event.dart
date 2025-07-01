class Event {
  final String category;
  final String time;
  final String description;
  final int childId; 

  Event({
    required this.category,
    required this.time,
    required this.description,
    required this.childId,
  });
}
