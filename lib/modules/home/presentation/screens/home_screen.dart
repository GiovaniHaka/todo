import 'package:flutter/material.dart';
import 'package:todo/modules/todos/todo_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void handleCreateTodo() {
    TodoRouter.goCreateTodo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Minhas tarefas'),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: handleCreateTodo,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
