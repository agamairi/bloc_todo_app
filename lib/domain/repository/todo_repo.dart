import 'package:todo_bloc/domain/Models/todo.dart';

abstract class TodoRepo {
  // get list
  Future<List<TodoTask>> getAllTodo();

  // add new
  Future<void> addTodo({required TodoTask newTodo});

  // update exsiting
  Future<void> updateTodo({required TodoTask updateTodo});

  // delete
  Future<void> deleteTodo({required TodoTask deleteTodo});
}
