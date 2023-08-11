import 'package:flutter/material.dart';

import './models/data_layer.dart';

class PlanProvider extends InheritedWidget {
  PlanProvider({super.key, required this.child}) : super(child: child);
  @override
  // ignore: overridden_fields
  final Widget child;
  final _plans = <Plan>[];

  @override
  bool updateShouldNotify(PlanProvider oldWidget) {
    return false;
  }

  static List<Plan>? of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider?._plans;
  }
}
