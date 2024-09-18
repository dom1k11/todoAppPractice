import 'package:flutter/material.dart';


class NewTaskPage extends StatelessWidget {
  const NewTaskPage({
    super.key,
    required this.onSave,
    required this.controller,
  });

  final TextEditingController controller;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do App"),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.pop(context);
      //   },
      // ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(20),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'New task',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  onSave();

                },
                icon: const Icon(
                  Icons.done,
                  color: Colors.greenAccent,
                  size: 40,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
