import 'package:flutter/material.dart';
import 'package:todo/core/apps/todo_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/core/binders/binder.dart';
import 'package:todo/globals/messages/messages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Messages.instance.setLanguage('pt_BR');

  AppBinder().setBinders();
  await getIt.allReady();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const TodoApp());
}
