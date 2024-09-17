import 'package:flutter/material.dart';
import '../widgets/tile_block.dart';
import '../models/task.dart';

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

  void newTaskFunction() {
    setState(() {
      if (newTaskController.text.isNotEmpty) {
        // Создаем новый объект Task и добавляем его в список
        toDoList.add(Task(taskName: newTaskController.text));
        newTaskController.clear(); // Очищаем поле ввода
      }
    });
  }

  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index); // Удаляем элемент из списка
    });
  }

  void markCompleted(int index) {
    setState(() {
      toDoList[index].isCompleted = !toDoList[index].isCompleted;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (BuildContext context, int index) {
          return TileBlock(
            toDoTask: toDoList[index],
            onDelete: () => deleteTask(index),
            onToggle: () {
              markCompleted(index);
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 0),
              color: Colors.blue,
              blurRadius: 10,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20, top: 7, bottom: 7),
                child: TextField(
                  controller: newTaskController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "New Task",
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                newTaskFunction();
              },
              icon: const Icon(
                Icons.edit_note_outlined,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
