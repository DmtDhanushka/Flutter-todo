import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard(
      {super.key,
      required this.taskName,
      required this.taskDone,
      required this.onChanged,
      required this.selected});

  final String taskName;
  final bool taskDone;
  final Function(bool?)? onChanged;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Card(
        color: selected ? Colors.yellow.shade400 : Colors.yellow.shade300,
        elevation: selected ? 5 : 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Checkbox(
                side: BorderSide(color: Colors.black87, width: 2),
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.selected)) {
                    return Colors.black87;
                  }
                  return null;
                }),
                value: taskDone,
                onChanged: onChanged,
              ),
              Text(
                taskName,
                style: TextStyle(
                    color: (taskDone ? Colors.black54 : Colors.black),
                    fontSize: 16,
                    decoration: (taskDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
