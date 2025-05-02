import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/task_provider.dart';

import '../task.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
        centerTitle: true,
      ),
      body: Consumer<TaskProvider>(
        builder: (context, taskProvider, child) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: "Enter Task",
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    taskProvider.addTask(
                      Task(
                        title: textController.text,
                        isCompleted: false,
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text("Add Task"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
