import 'package:isar/isar.dart';
import 'package:todo_bloc/domain/Models/todo.dart';

part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String desc;
  late bool isComplete;

  TodoTask toDomnain() {
    return TodoTask(
      id: id,
      desc: desc,
      isComplete: isComplete,
    );
  }

  static TodoIsar fromDomain(TodoTask todoTask) {
    return TodoIsar()
      ..id = todoTask.id
      ..desc = todoTask.desc
      ..isComplete = todoTask.isComplete;
  }
}
