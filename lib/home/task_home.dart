import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherapp/providers/task_provider.dart';

import '../providers/themeProvider.dart';
import 'add_task.dart';

class TaskHome extends StatelessWidget {
  const TaskHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<ThemeProvider>(
              builder: (context, themeProvider, child) {
                return Switch(
                    activeColor: Colors.white,
                    inactiveThumbColor: Colors.white,
                    thumbColor: WidgetStatePropertyAll(Colors.orange),
                    inactiveTrackColor: Colors.transparent,
                    thumbIcon: WidgetStatePropertyAll(
                      themeProvider.isSelected
                          ? const Icon(Icons.nights_stay)
                          : const Icon(Icons.wb_sunny),
                    ),
                    value: themeProvider.isSelected,
                    onChanged: (value) {
                      themeProvider.toggleTheme();
                    });
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<TaskProvider>(
              builder: (context, taskProvider, child) {
                return ListView.builder(
                  itemCount: taskProvider.tasks.length,
                  itemBuilder: (BuildContext context, index) {
                    return ListTile(
                      title: Text("${taskProvider.tasks[index].title}"),
                      trailing: Wrap(
                        children: [
                          Checkbox(
                            value: taskProvider.tasks[index].isCompleted,
                            onChanged: (_) {
                              context.read<TaskProvider>().toggleTask(index);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    final textController =
                                        TextEditingController();
                                    return AlertDialog(
                                      title: const Text("Edit Task test"),
                                      content: TextField(
                                        controller: textController,
                                        decoration: const InputDecoration(
                                          hintText: "Enter Task",
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            context
                                                .read<TaskProvider>()
                                                .editTask(
                                                    index, textController.text);
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Edit Task"),
                                        ),
                                      ],
                                    );
                                  });
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              context.read<TaskProvider>().deleteTask(index);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Timer
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const AddTask();
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
