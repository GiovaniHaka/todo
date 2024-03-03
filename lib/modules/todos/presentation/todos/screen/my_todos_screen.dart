import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:todo/globals/messages/messages.dart';
import 'package:todo/globals/states/onze_state.dart';
import 'package:todo/globals/ui/views/failure_view.dart';
import 'package:todo/globals/ui/views/loading_view.dart';

import 'package:todo/modules/todos/presentation/todos/controllers/my_todos_controller.dart';
import 'package:todo/modules/todos/presentation/todos/widgets/todo_list.dart';
import 'package:todo/modules/todos/todo_router.dart';

class MyTodosScreen extends StatefulWidget {
  final MyTodosController controller;

  const MyTodosScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<MyTodosScreen> createState() => _MyTodosScreenState();
}

class _MyTodosScreenState extends State<MyTodosScreen> {
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
      body: RxBuilder(
        builder: (_) {
          final state = widget.controller.todos;

          if (state is Error) {
            final failure = state.failure;
            return FailureView(failure: failure);
          }

          if (state is Empty) {
            return Center(
              child: Text(Messages.instance.lang.emptyTodos),
            );
          }

          if (state is Loaded) {
            final todos = state.data;

            return TodoList(
              todos: todos,
              onTodoTap: (todo) {},
            );
          }

          return const LoadingView();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: handleCreateTodo,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
