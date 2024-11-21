import 'package:isar/isar.dart';
import 'package:todo_bloc/data/models/isar_todo.dart';
import 'package:todo_bloc/domain/Models/todo.dart';
import 'package:todo_bloc/domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;
  IsarTodoRepo(this.db);

  @override
  Future<List<TodoTask>> getAllTodo() async {
    final allTodos = await db.todoIsars.where().findAll();

    return allTodos.map((e) => e.toDomnain()).toList();
  }

  @override
  Future<void> addTodo({required TodoTask newTodo}) {
    final todoIsar = TodoIsar.fromDomain(newTodo);
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> deleteTodo({required TodoTask deleteTodo}) {
    return db.writeTxn(() => db.todoIsars.delete(deleteTodo.id));
  }

  @override
  Future<void> updateTodo({required TodoTask updateTodo}) {
    final todoIsar = TodoIsar.fromDomain(updateTodo);

    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }
}
