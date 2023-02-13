import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoList extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoList({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
          right: 20,
          left: 20,
          top: 20,
        ),
        child: Slidable(
          endActionPane: ActionPane(
            motion: StretchMotion(),
            children: <Widget>[
              SlidableAction(onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Colors.red.shade400,
                borderRadius: BorderRadius.circular(10),
              )
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                //checkbox
                Checkbox(
                  value: taskCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.black,
                ),
                //taskname
                Text(
                  taskName,
                  style: TextStyle(fontSize: 20,
                    color: Colors.white,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ));
  }
}
