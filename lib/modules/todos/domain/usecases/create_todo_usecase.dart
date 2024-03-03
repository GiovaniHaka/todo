import 'package:dartz/dartz.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/modules/todos/domain/entities/create_todo_entity.dart';
import 'package:todo/modules/todos/domain/repositories/todo_repository.dart';
import 'package:todo/services/device_info/onze_device_info_service.dart';
import 'package:todo/services/file_picker/domain/models/picked_file_entity.dart';
import 'package:todo/services/storage/domain/entities/upload_file_entity.dart';
import 'package:todo/services/storage/domain/usecases/upload_single_file.dart';

abstract class CreateTodoUsecase {
  Future<Either<Failure, void>> call({
    required String title,
    required DateTime date,
    required PickedFile? file,
  });
}

class CreateTodoUsecaseImpl implements CreateTodoUsecase {
  final TodoRepository _repository;
  final OnzeDeviceInfoService _deviceInfoService;
  final UploadSingleFile _uploadSingleFile;

  CreateTodoUsecaseImpl({
    required TodoRepository repository,
    required OnzeDeviceInfoService deviceInfoService,
    required UploadSingleFile uploadSingleFile,
  })  : _repository = repository,
        _deviceInfoService = deviceInfoService,
        _uploadSingleFile = uploadSingleFile;

  @override
  Future<Either<Failure, void>> call({
    required String title,
    required DateTime date,
    required PickedFile? file,
  }) async {
    try {
      final deviceId = _deviceInfoService.deviceInfo.deviceId;

      String? imageUrl;

      if (file != null) {
        final uploadSingleFile = UploadFileEntity(
          path: 'images/$deviceId/',
          pickedFile: file,
        );

        final result = await _uploadSingleFile(uploadSingleFile);

        result.fold(
          (failure) => Left(failure),
          (success) => imageUrl = success.url,
        );
      }

      final entity = CreateTodoEntity(
        deviceId: deviceId,
        title: title,
        date: date,
        imageUrl: imageUrl,
      );

      return await _repository.createTodo(entity);
    } catch (e, s) {
      return Left(Failure(error: e, stackTrace: s));
    }
  }
}
