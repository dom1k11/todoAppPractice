import 'package:flutter/material.dart';
import '../widgets/tile_block.dart';
import '../models/task.dart';
import 'new_task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> toDoList = [
    Task(taskName: "Coding"),
    Task(taskName: "Eating"),
    Task(taskName: "Sleeping"),
  ];

  final TextEditingController newTaskController = TextEditingController();

  void addTask() {
    setState(() {
      if (newTaskController.text.isNotEmpty) {
        // Создаем новый объект Task и добавляем его в список
        toDoList.add(Task(taskName: newTaskController.text));
        newTaskController.clear(); // Очищаем поле ввода
        Navigator.pop(context);
        newTaskSnackBar(context, "New Task Added", Colors.greenAccent);
      } else {
        (print("input in task needed"));
        newTaskSnackBar(context, "Input Required", Colors.redAccent);
      }
    });
  }

  void deleteTask(int index, BuildContext context) {
    setState(() {
      toDoList.removeAt(index);
      final deletedTaskSnackBar = SnackBar(
        content: Text(
          "Task Deleted",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellowAccent.shade200,
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {},
        ),
      ); //
      ScaffoldMessenger.of(context)
          .showSnackBar(deletedTaskSnackBar); // Удаляем элемент из списка
    });
  }

  void markCompleted(int index) {
    setState(() {
      toDoList[index].isCompleted = !toDoList[index].isCompleted;
    });
  }

  void newTaskSnackBar(BuildContext context, String message, Color color) {
    final newTaskSnackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.black),
      ),
      duration: Duration(seconds: 1),
      backgroundColor: color,
    );
    ScaffoldMessenger.of(context).showSnackBar(newTaskSnackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (BuildContext context, int index) {
                return TileBlock(
                  toDoTask: toDoList[index],
                  onDelete: () => deleteTask(index, context),
                  onToggle: () {
                    markCompleted(index);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade200,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewTaskPage(
                controller: newTaskController,
                onSave: addTask,
              ),
            ),
          );
        },
        child: const Icon(
          Icons.edit_note_outlined,
          size: 40,
          color: Colors.black,
        ),
      ),
    );
  }
}
