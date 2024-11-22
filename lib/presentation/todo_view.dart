import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/domain/Models/todo.dart';
import 'package:todo_bloc/presentation/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  void _showAddTodo(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final task = TextEditingController();

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add Todo'),
            content: TextField(
              controller: task,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  todoCubit.addTodo(task.text);
                  Navigator.pop(context);
                },
                child: const Text('Add'),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'ToDo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () => _showAddTodo(context),
      ),
      body: BlocBuilder<TodoCubit, List<TodoTask>>(builder: (context, todos) {
        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            final todo = todos[index];
            return ListTile(
              leading: Checkbox(
                value: todo.isComplete,
                onChanged: (value) {
                  todoCubit.toggleComplete(todo);
                },
              ),
              title: Text(
                todo.desc,
                style: const TextStyle(color: Colors.white),
              ),
              trailing: IconButton(
                onPressed: () {
                  todoCubit.deleteTodo(todo);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
