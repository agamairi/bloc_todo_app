import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/domain/Models/todo.dart';
import 'package:todo_bloc/domain/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<TodoTask>> {
  final TodoRepo todoRepo;

  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  Future<void> loadTodos() async {
    final todoList = await todoRepo.getAllTodo();
    emit(todoList);
  }

  Future<void> addTodo(String desc) async {
    final newTodo =
        TodoTask(id: DateTime.now().millisecondsSinceEpoch, desc: desc);
    await todoRepo.addTodo(newTodo: newTodo);

    loadTodos();
  }

  Future<void> deleteTodo(TodoTask deleteTodo) async {
    await todoRepo.deleteTodo(deleteTodo: deleteTodo);
    loadTodos();
  }

  Future<void> updateTodo(TodoTask updateTask) async {
    final updateTodo = updateTask.toggleComplete();

    await todoRepo.updateTodo(updateTodo: updateTodo);

    loadTodos();
  }
}
