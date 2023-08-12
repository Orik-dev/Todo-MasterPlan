import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../repositories/repository.dart';
import 'task.dart';

class Plan {
  final int? id;
  String? name;
  final List<Task> tasks;
  Plan(this.tasks, {@required this.id, this.name});
  int get completeCount => tasks.where((task) => task.complete).length;

  String get completenessMessage =>
      '$completeCount из ${tasks.length} задач выполнено';

  Plan.fromModel(Model model)
      : id = model.id,
        name = model.data['name'] ?? '',
        tasks = model.data['task']
                ?.map<Task>((task) => Task.fromModel(task))
                ?.toList() ??
            <Task>[];

  Model toModel() => Model(id: id, data: {
        'name': name,
        'tasks': tasks.map((task) => task.toModel()).toList(),
      });
}
