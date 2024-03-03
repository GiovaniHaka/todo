import 'package:flutter/material.dart';
import 'package:todo/core/apps/todo_app_router.dart';
import 'package:todo/globals/keys/snackbar_key.dart';
import 'package:todo/globals/ui/styles/onze_colors.dart';

final router = TodoAppRouter().router;

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: OnzeColors.primaryRegular),
        useMaterial3: true,
      ),
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      scaffoldMessengerKey: snackbarKey,
    );
  }
}
