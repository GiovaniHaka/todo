import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/modules/todos/domain/entities/create_todo_entity.dart';
import 'package:todo/modules/todos/domain/repositories/todo_repository.dart';
import 'package:todo/services/device_info/onze_device_info_service.dart';

abstract class CreateTodoUsecase {
  Future<Either<Failure, void>> call({
    required String title,
    required DateTime date,
  });
}

class CreateTodoUsecaseImpl implements CreateTodoUsecase {
  final TodoRepository _repository;
  final OnzeDeviceInfoService _deviceInfoService;

  CreateTodoUsecaseImpl({
    required TodoRepository repository,
    required OnzeDeviceInfoService deviceInfoService,
  })  : _repository = repository,
        _deviceInfoService = deviceInfoService;

  @override
  Future<Either<Failure, void>> call({
    required String title,
    required DateTime date,
  }) async {
    try {
      final entity = CreateTodoEntity(
        deviceId: _deviceInfoService.deviceInfo.deviceId,
        title: title,
        date: date,
      );

      return await _repository.createTodo(entity);
    } catch (e, s) {
      return Left(Failure(error: e, stackTrace: s));
    }
  }
}
