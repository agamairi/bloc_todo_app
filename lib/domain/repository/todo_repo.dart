import 'package:todo_bloc/domain/Models/todo.dart';

abstract class TodoRepo {
  // get list
  Future<List<TodoTask>> getAllTodo();

  // add new
  Future<void> addTodo({TodoTask newTodo});

  // update exsiting
  Future<void> updateTodo({TodoTask updateTodo});

  // delete
  Future<void> deleteTodo({TodoTask deleteTodo});
}
