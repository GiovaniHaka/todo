import 'dart:developer';

/// Classe que representa uma falha ou erro ocorrido durante a execução do aplicativo.
class Failure {
  late String _message;
  late Object _error;
  late StackTrace? _stackTrace;

  /// Construtor da classe [Failure].
  ///
  /// [message] é a mensagem de erro associada à falha.
  /// [error] é o objeto de erro associado à falha.
  /// [stackTrace] é o rastreamento de pilha associado à falha.
  Failure({String? message, Object? error, StackTrace? stackTrace}) {
    _message = message ?? 'Houve um erro inesperado.';
    _error = error ?? 'Erro desconhecido.';
    _stackTrace = stackTrace;
    log('Failure: $_message', error: _error, stackTrace: _stackTrace);
  }

  /// Retorna a mensagem de erro associada à falha.
  String get message => _message;

  /// Retorna o objeto de erro associado à falha.
  Object get error => _error;

  /// Retorna o rastreamento de pilha associado à falha.
  StackTrace? get stackTrace => _stackTrace;
}
