import 'package:flutter/material.dart';

import '../models/data_layer.dart';
// ignore: unused_import
import '../plan_provider.dart';

class PlanScreen extends StatefulWidget {
  final Plan? plan;
  const PlanScreen({Key? key, this.plan}) : super(key: key);

  @override
  State createState() => _PlanScreen();
}

class _PlanScreen extends State<PlanScreen> {
  ScrollController? scrollController;
  Plan? get plan => widget.plan;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  }

  @override
  void dispose() {
    scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Master Plan'),
      ),
      body: Column(
        children: [
          Expanded(child: _buildList()),
          SafeArea(child: Text(plan!.completenessMessage))
        ],
      ),
      floatingActionButton: _buildAddTaskButton(),
    );
  }

  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        setState(() {
          plan?.tasks.add(Task());
        });
      },
    );
  }

  Widget _buildList() {
    return ListView.builder(
      controller: scrollController,
      itemCount: plan?.tasks.length,
      itemBuilder: (context, index) => _buildTaskTile(plan!.tasks[index]),
    );
  }

  Widget _buildTaskTile(Task task) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          setState(() {
            task.complete = selected!;
          });
        },
      ),
      title: TextFormField(
        initialValue: task.description,
        onFieldSubmitted: (text) {
          setState(() {
            task.description = text;
          });
        },
      ),
    );
  }
}
