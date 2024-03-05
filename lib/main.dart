import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo/core/apps/todo_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo/core/binders/binder.dart';
import 'package:todo/globals/messages/messages.dart';
import 'package:todo/services/device_info/onze_device_info_service.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

/// Função principal que inicializa o aplicativo.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Messages.instance.setLanguage('pt_BR');

  Intl.defaultLocale = 'pt_BR';
  initializeDateFormatting('pt_BR');

  AppBinder().setBinders();
  await getIt.allReady();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await getIt<OnzeDeviceInfoService>().initialize();

  runApp(const TodoApp());
}
