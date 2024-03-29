import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'package:todo/globals/messages/messages.dart';
import 'package:todo/globals/states/onze_state.dart';
import 'package:todo/globals/ui/app_bars/onze_app_bar.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';
import 'package:todo/globals/ui/views/empty_view.dart';
import 'package:todo/globals/ui/views/failure_view.dart';
import 'package:todo/globals/ui/views/loading_view.dart';
import 'package:todo/modules/todos/domain/entities/todo_entity.dart';
import 'package:todo/modules/todos/domain/enums/todo_status.dart';
import 'package:todo/modules/todos/presentation/todo_carousel/todo_carousel.dart';
import 'package:todo/modules/todos/presentation/todos/controllers/delete_todo_controller.dart';
import 'package:todo/modules/todos/presentation/todos/controllers/my_todos_controller.dart';
import 'package:todo/modules/todos/presentation/todos/controllers/update_todo_status_controller.dart';
import 'package:todo/modules/todos/presentation/todos/widgets/todo_list.dart';
import 'package:todo/modules/todos/todo_router.dart';

/// Classe que representa a tela de meus todos.
class MyTodosScreen extends StatefulWidget {
  final MyTodosController controller;
  final UpdateTodoStatusController updateStatusController;
  final DeleteTodoController deleteTodoController;

  const MyTodosScreen({
    Key? key,
    required this.controller,
    required this.updateStatusController,
    required this.deleteTodoController,
  }) : super(key: key);

  @override
  State<MyTodosScreen> createState() => _MyTodosScreenState();
}

class _MyTodosScreenState extends State<MyTodosScreen> {
  void handleCreateTodo() {
    TodoRouter.goCreateTodo(context);
  }

  handleUpdateTodoStatus(TodoEntity todo) {
    final currentStatus = todo.status;

    TodoStatus newStatus;

    if (currentStatus == TodoStatus.completed) {
      newStatus = TodoStatus.pending;
    } else {
      newStatus = TodoStatus.completed;
    }

    widget.updateStatusController.updateTodoStatus(
      id: todo.id,
      status: newStatus,
    );
  }

  handleDelete(TodoEntity todo) {
    widget.deleteTodoController.deleteById(
      id: todo.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: OnzeAppBar(
        backgroundColor: OnzeColors.primaryRegular,
        titleText: Messages.instance.lang.myTodos,
      ),
      body: RxBuilder(
        builder: (_) {
          final state = widget.controller.todos;

          if (state is Error) {
            final failure = state.failure;
            return FailureView(failure: failure);
          }

          if (state is Empty) {
            return EmptyView(
              message: Messages.instance.lang.emptyTodos,
            );
          }

          if (state is Loaded) {
            final todos = state.data;

            return Column(
              children: [
                Builder(builder: (context) {
                  if (todos.isEmpty) {
                    return const SizedBox();
                  }

                  final pendingTodos = todos.reversed
                      .where((todo) => todo.isPending)
                      .toList()
                      .take(3)
                      .toList();

                  if (pendingTodos.isEmpty) {
                    return const SizedBox();
                  }

                  return TodoCarousel(
                    todos: pendingTodos,
                    onTapCompleteTodo: handleUpdateTodoStatus,
                  );
                }),
                Expanded(
                  child: TodoList(
                    todos: todos,
                    onTapTodo: handleUpdateTodoStatus,
                    onTapDeleteTodo: handleDelete,
                  ),
                ),
              ],
            );
          }

          return const LoadingView();
        },
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: OnzeColors.primaryRegular,
        onPressed: handleCreateTodo,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
