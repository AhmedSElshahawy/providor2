import 'package:flutter/material.dart';
import 'package:weatherapp/task.dart';

class TaskProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(title: 'Learn Flutter', isCompleted: true),
    Task(title: 'Drink Water', isCompleted: false),
    Task(title: 'Play Football', isCompleted: true),
    Task(title: 'Add More Todos', isCompleted: false),
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTask(int index) {
    _tasks[index].isDone();
    notifyListeners();
  }

  void deleteTask(int index) {
    _tasks.removeAt(index);
    notifyListeners();
  }

  void editTask(int index, String newText) {
    _tasks[index].title = newText;
    notifyListeners();
  }
}
