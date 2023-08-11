import 'package:flutter/material.dart';
import 'package:todo/controllers/plan_controller.dart';

import './models/data_layer.dart';

class PlanProvider extends InheritedWidget {
  final _controller = PlanController();
  static PlanController of(BuildContext context) {
    PlanProvider? provider =
        context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider!._controller;
  }

  PlanProvider({super.key, required this.child}) : super(child: child);
  @override
  // ignore: overridden_fields
  final Widget child;
  final _plans = <Plan>[];

  @override
  bool updateShouldNotify(PlanProvider oldWidget) {
    return false;
  }

  static List<Plan>? ofPlans(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider?._plans;
  }
}
