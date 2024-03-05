import 'package:todo/globals/failures/failure.dart';

/// Classe abstrata que representa o estado genérico de uma tela ou componente.
/// 
/// Essa classe define as propriedades e métodos básicos que um estado deve ter.
/// Ela é genérica em relação ao tipo de dado que o estado irá armazenar.
abstract class OnzeState<T> {
  /// Define o valor do dado do estado.
  set data(T data) => throw UnimplementedError();

  /// Obtém o valor do dado do estado.
  T get data => throw UnimplementedError('$this');

  /// Define o objeto de falha do estado.
  set failure(Failure data) => throw UnimplementedError();

  /// Obtém o objeto de falha do estado.
  Failure get failure => throw UnimplementedError();
}

/// Classe que representa o estado inicial.
class Initial<T> extends OnzeState<T> {}

/// Classe que representa o estado de carregamento.
class Loading<T> extends OnzeState<T> {}

/// Classe que representa o estado vazio.
class Empty<T> extends OnzeState<T> {}

/// Classe que representa o estado de erro.
class Error<T> extends OnzeState<T> {
  late Failure _failure;

  @override
  Failure get failure => _failure;

  @override
  set failure(Failure data) {
    _failure = data;
  }

  /// Cria uma instância de `Error` com uma falha opcional.
  Error([Failure? failure]) : _failure = failure ?? Failure();
}

/// Classe que representa o estado carregado com sucesso.
class Loaded<T> extends OnzeState<T> {
  late T _data;

  @override
  T get data => _data;

  @override
  set data(T data) {
    _data = data;
  }

  /// Cria uma instância de `Loaded` com o valor fornecido.
  Loaded(T value) {
    data = value;
  }
}
