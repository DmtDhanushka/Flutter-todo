import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  const TodoCard(
      {super.key,
      required this.taskName,
      required this.taskDone,
      required this.onChanged});

  final String taskName;
  final bool taskDone;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Card(
        color: Colors.yellow.shade300,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Checkbox(
                value: taskDone,
                onChanged: onChanged,
              ),
              Text(taskName),
            ],
          ),
        ),
      ),
    );
  }
}
