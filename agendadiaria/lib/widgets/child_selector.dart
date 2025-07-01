import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/agenda_provider.dart';

class ChildSelector extends StatelessWidget {
  const ChildSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AgendaProvider>(context);
    final children = provider.children;
    final selectedId = provider.selectedChildId;

    return Row(
      children: [
        const Text(
          'Hijo:',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(width: 12),
        DropdownButton<int?>(
          value: selectedId,
          hint: const Text('Todos'),
          items: [
            const DropdownMenuItem(
              value: null,
              child: Text('Todos'),
            ),
            ...children.map((child) => DropdownMenuItem(
                  value: child.id,
                  child: Text(child.name),
                )),
          ],
          onChanged: (value) {
            provider.selectChild(value);
          },
        ),
      ],
    );
  }
}
