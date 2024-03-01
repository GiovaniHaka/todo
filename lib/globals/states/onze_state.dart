import 'package:todo/globals/failures/failure.dart';

abstract class OnzeState<T> {
  set data(T data) => throw UnimplementedError();
  T get data => throw UnimplementedError('$this');

  set failure(Failure data) => throw UnimplementedError();
  Failure get failure => throw UnimplementedError();
}

class Initial<T> extends OnzeState<T> {}

class Loading<T> extends OnzeState<T> {}

class Empty<T> extends OnzeState<T> {}

class Error<T> extends OnzeState<T> {
  late Failure _failure;

  @override
  Failure get failure => _failure;

  @override
  set failure(Failure data) {
    _failure = data;
  }

  Error([Failure? failure]) : _failure = failure ?? Failure();
}

class Loaded<T> extends OnzeState<T> {
  late T _data;

  @override
  T get data => _data;

  @override
  set data(T data) {
    _data = data;
  }

  Loaded(T value) {
    data = value;
  }
}
