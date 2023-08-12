import 'package:logger/logger.dart';

import '../models/data_layer.dart';
import '../repositories/in_memory_cache.dart';
import '../repositories/repository.dart';

class PlanServices {
  // ignore: unused_field
  final Repository _repository = InMemoryCache();

  Plan createPlan(String name) {
    final model = _repository.create();
    final plan = Plan.fromModel(model)..name = name;
    savePlan(plan);
    return plan;
  }

  void savePlan(Plan plan) {
    _repository.update(plan.toModel());
  }

  void delete(Plan plan) {
    _repository.delete(plan.toModel());
  }

  List<Plan> getAllPlans() {
    return _repository
        .getAll()
        .map<Plan>((model) => Plan.fromModel(model))
        .toList();
  }

  void addTask(Plan plan, String description) {
    final logger = Logger();

    try {
      final id = plan.tasks.isNotEmpty ? plan.tasks.last.id! + 1 : 1;
      final task = Task(id: id, description: description);
      plan.tasks.add(task);
      savePlan(plan);
    } catch (e) {
      logger.e('Exception caught: $e');
    }
  }

  void deleteTask(Plan plan, Task task) {
    final logger = Logger();

    try {
      plan.tasks.remove(task);
      savePlan(plan);
    } catch (e) {
      logger.e('Exception caught: $e');
    }
  }
}
