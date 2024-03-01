import 'dart:developer';

class Failure {
  late String _message;
  late Object _error;
  late StackTrace? _stackTrace;

  Failure({String? message, Object? error, StackTrace? stackTrace}) {
    _message = message ?? 'Houve um erro inesperado.';
    _error = error ?? 'Erro desconhecido.';
    _stackTrace = stackTrace;
    log('Failure: $_message', error: _error, stackTrace: _stackTrace);
  }

  String get message => _message;

  Object get error => _error;

  StackTrace? get stackTrace => _stackTrace;
}
