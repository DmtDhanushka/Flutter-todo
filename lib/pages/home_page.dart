import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:todoapp/data/database.dart';
import 'package:todoapp/util/TodoCard.dart';

import '../util/dialog_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _box = Hive.box('NOTES_BOX');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
    // TODO: implement initState
    if (_box.get('NOTES') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final notesBox = 'NOTES_BOX';

  final _controller = TextEditingController();
  int selected = -1;

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = value;
    });
  }

  void saveTask() {
    setState(() {
      db.todoList.add([_controller.text, false, false]);
      _controller.clear();
    });
    Navigator.pop(context, 'OK');
    db.updateDb();
  }

  void onClear() {
    setState(() {
      _controller.clear();
    });
    Navigator.pop(context, 'Cancel');
  }

  void displayDialogBox() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveTask,
          onClear: onClear,
        );
      },
    );
  }

  void onLongPress(index) {
    setState(() {
      db.todoList[index][2] = true;
      selected = index;
    });
  }

  void cancelSelect(index) {
    setState(() {
      db.todoList[index][2] = false;
      selected = -1;
    });
  }

  void deleteTask(index) {
    setState(() {
      db.todoList.removeAt(index);
      selected = -1;
    });
    db.updateDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo App'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        actions: selected != -1
            ? [
                Row(
                  children: [
                    IconButton(
                        onPressed: () => deleteTask(selected),
                        icon: const Icon(Icons.delete)),
                    IconButton(
                        onPressed: () => cancelSelect(selected),
                        icon: const Icon(Icons.close)),
                  ],
                )
              ]
            : null,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: db.todoList.isEmpty
          ? const Center(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.search,
                  weight: 100.0,
                  opticalSize: 20,
                  size: 48,
                  color: Colors.black45,
                ),
                Text(
                  'Such a Empty!',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                Text(
                  'Lets try adding one',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                ),
              ],
            ))
          : ListView.builder(
              itemCount: db.todoList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onLongPress: () => onLongPress(index),
                  child: TodoCard(
                      selected: db.todoList[index][2],
                      taskName: db.todoList[index][0],
                      taskDone: db.todoList[index][1],
                      onChanged: (value) => checkBoxChanged(value, index)),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: displayDialogBox,
        child: const Icon(Icons.add),
      ),
    );
  }
}
