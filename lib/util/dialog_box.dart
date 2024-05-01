import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onClear,
  });
  final TextEditingController? controller;
  final VoidCallback onSave;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add new task'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
              controller: controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Task name',
              ))
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: onClear,
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: onSave,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
