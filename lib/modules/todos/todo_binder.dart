import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/core/binders/binder.dart';
import 'package:todo/modules/todos/data/datasources/remote/todo_datasource_remote_impl.dart';
import 'package:todo/modules/todos/data/datasources/todo_datasource.dart';
import 'package:todo/modules/todos/data/repositories/todo_repository_impl.dart';
import 'package:todo/modules/todos/domain/repositories/todo_repository.dart';
import 'package:todo/modules/todos/domain/usecases/create_todo_usecase.dart';
import 'package:todo/modules/todos/domain/usecases/delete_todo_usecase.dart';
import 'package:todo/modules/todos/domain/usecases/stream_todos_usecase.dart';
import 'package:todo/modules/todos/domain/usecases/update_todo_usecase.dart';
import 'package:todo/modules/todos/presentation/create_todo/controllers/create_todo_controller.dart';
import 'package:todo/modules/todos/presentation/todos/controllers/delete_todo_controller.dart';
import 'package:todo/modules/todos/presentation/todos/controllers/my_todos_controller.dart';
import 'package:todo/modules/todos/presentation/todos/controllers/update_todo_status_controller.dart';

class TodoBinder implements Binder {
  @override
  void bind() {
    /// [Sources]
    getIt.registerFactory<TodoDatasource>(
      () => TodoDatasourceRemoteImpl(firestore: FirebaseFirestore.instance),
    );

    /// [Repositories]
    getIt.registerFactory<TodoRepository>(
      () => TodoRepositoryImpl(
        todoDataSource: getIt.get(),
      ),
    );

    /// [Usecases]
    getIt.registerFactory<CreateTodoUsecase>(
      () => CreateTodoUsecaseImpl(
        deviceInfoService: getIt.get(),
        repository: getIt.get(),
      ),
    );

    getIt.registerFactory<StreamTodosUsecase>(
      () => StreamTodosUsecaseImpl(
        deviceInfoService: getIt.get(),
        repository: getIt.get(),
      ),
    );

    getIt.registerFactory<UpdateTodoUsecase>(
      () => UpdateTodoUsecaseImpl(
        repository: getIt.get(),
      ),
    );

    getIt.registerFactory<DeleteTodoUsecase>(
      () => DeleteTodoUsecaseImpl(
        repository: getIt.get(),
      ),
    );

    /// [Controllers]
    getIt.registerFactory<CreateTodoController>(
      () => CreateTodoController(
        createTodoUsecase: getIt.get(),
      ),
    );

    getIt.registerLazySingleton<MyTodosController>(
      () => MyTodosController(
        streamTodos: getIt.get(),
      ),
    );

    getIt.registerFactory<UpdateTodoStatusController>(
      () => UpdateTodoStatusController(
        updateTodoUseCase: getIt.get(),
      ),
    );

    getIt.registerFactory<DeleteTodoController>(
      () => DeleteTodoController(
        deleteTodoUseCase: getIt.get(),
      ),
    );
  }

  @override
  void dispose() {}
}
