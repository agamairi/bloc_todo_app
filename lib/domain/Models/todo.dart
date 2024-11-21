class TodoTask {
  final int id;
  final String desc;
  final bool isComplete;

  TodoTask({
    required this.id,
    required this.desc,
    this.isComplete = false,
  });

  TodoTask toggleComplete() {
    return TodoTask(
      id: id,
      desc: desc,
      isComplete: !isComplete,
    );
  }
}
