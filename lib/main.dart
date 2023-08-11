import 'package:flutter/material.dart';
import 'package:todo/plan_provider.dart';
import 'package:todo/views/plan_creator_screen.dart';

void main() => runApp(PlanProvider(child: const Todo()));

class Todo extends StatelessWidget {
  const Todo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      home: PlanProvider(
        child: const PlanCreatorScreen(),
      ),
    );
  }
}
