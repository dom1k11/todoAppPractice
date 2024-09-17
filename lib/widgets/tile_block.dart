import 'package:flutter/material.dart';
import 'package:to_do_app_practice/models/task.dart';


class TileBlock extends StatefulWidget {
  const TileBlock({
    super.key,
    required this.toDoTask,
    required this.onDelete,
    required this.onToggle,
  });

  final Task toDoTask;
  final VoidCallback onDelete;
  final VoidCallback onToggle;

  @override
  State<TileBlock> createState() => _TileBlockState();
}

class _TileBlockState extends State<TileBlock> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //удаление свайпом
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.fromLTRB(34, 10, 20, 0),
      decoration: BoxDecoration(
          color: Colors.blue.shade200, borderRadius: BorderRadius.circular(20)),
      child: ListTile(
        trailing: IconButton(
          onPressed: widget.onDelete,
          icon: const Icon(Icons.delete_outline),
          color: Colors.redAccent.shade200,
        ),
        title: Text(widget.toDoTask.taskName),
        leading: IconButton(
          icon: Icon(widget.toDoTask.isCompleted
              ? Icons.check_box_outlined
              : Icons.check_box_outline_blank_outlined),
          onPressed: () {
            widget.onToggle();
          },
        ),
      ),
    );
  }
}
