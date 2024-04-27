import 'package:flutter/material.dart';
import 'package:todoapp/util/TodoCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [
    ['Go to gym', false],
    ['Read book', false],
  ];

  Function(bool?)? onChanged;
  Function()? addTask;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
        backgroundColor: Colors.yellow.shade600,
      ),
      backgroundColor: Colors.yellow.shade100,
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return TodoCard(
              taskName: todoList[index][0],
              taskDone: todoList[index][1],
              onChanged: onChanged);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
