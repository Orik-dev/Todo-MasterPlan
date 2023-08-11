import 'task.dart';

class Plan {
  String name = '';
  final List<Task> tasks = [];

  int get completeCount => tasks.where((task) => task.complete).length;

  String get completenessMessage =>
      '$completeCount из ${tasks.length} задач выполнено';
}
