import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/modules/todos/domain/entities/todo_entity.dart';
import 'package:todo/modules/todos/domain/repositories/todo_repository.dart';
import 'package:todo/services/device_info/onze_device_info_service.dart';

abstract class StreamTodosUsecase {
  Stream<Either<Failure, List<TodoEntity>>> call();
}

class StreamTodosUsecaseImpl implements StreamTodosUsecase {
  final TodoRepository _repository;
  final OnzeDeviceInfoService _deviceInfoService;

  StreamTodosUsecaseImpl({
    required TodoRepository repository,
    required OnzeDeviceInfoService deviceInfoService,
  })  : _repository = repository,
        _deviceInfoService = deviceInfoService;

  @override
  Stream<Either<Failure, List<TodoEntity>>> call() async* {
    try {
      final deviceId = _deviceInfoService.deviceInfo.deviceId;
      yield* _repository.streamTodos(deviceId);
    } catch (e, s) {
      yield Left(Failure(error: e, stackTrace: s));
    }
  }
}
