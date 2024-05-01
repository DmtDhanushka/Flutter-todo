import 'package:hive/hive.dart';

class TodoDatabase {
  List todoList = [];
  final box = Hive.box('NOTES_BOX');

  void createInitialData() {
    todoList = [
      ['Go to xxx', false, false],
      ['Read xx', true, false],
    ];
  }

  void loadData() {
    todoList = box.get('NOTES');
  }

  void updateDb() {
    box.put('NOTES', todoList);
  }
}
