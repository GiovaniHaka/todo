import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo/core/binders/binder.dart';
import 'package:todo/globals/ui/screens/route_not_found_screen.dart';
import 'package:todo/modules/todos/presentation/todos/screen/my_todos_screen.dart';
import 'package:todo/modules/todos/todo_router.dart';

class TodoAppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static const _root = '/';

  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: _root,
    errorBuilder: (context, state) => RouteNotFoundScreen(
      onTap: () => GoRouter.of(context).goNamed(_root),
    ),
    routes: [
      GoRoute(
        name: _root,
        path: _root,
        builder: (context, state) {
          return MyTodosScreen(
            controller: getIt.get(),
            updateStatusController: getIt.get(),
            deleteTodoController: getIt.get(),
          );
        },
        routes: [
          ...TodoRouter.routes,
        ],
      ),
    ],
  );
}
