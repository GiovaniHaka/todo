import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/binders/binder.dart';
import 'package:todo/modules/todos/presentation/create_todo/screens/create_todo_screen.dart';

class TodoRouter {
  static const createTodo = '/create-todo';

  static final routes = [
    GoRoute(
      name: createTodo,
      path: 'create-todo',
      builder: (context, state) => CreateTodoScreen(
        createTodoController: getIt.get(),
      ),
    ),
  ];

  static void goCreateTodo(BuildContext context) {
    GoRouter.of(context).go(createTodo);
  }
}
