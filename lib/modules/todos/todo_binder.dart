
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/core/binders/binder.dart';
import 'package:todo/modules/todos/data/datasources/remote/todo_datasource_remote_impl.dart';
import 'package:todo/modules/todos/data/datasources/todo_datasource.dart';
import 'package:todo/modules/todos/data/repositories/todo_repository_impl.dart';
import 'package:todo/modules/todos/domain/repositories/todo_repository.dart';
import 'package:todo/modules/todos/domain/usecases/create_todo_usecase.dart';
import 'package:todo/modules/todos/presentation/create_todo/controllers/create_todo_controller.dart';

class TodoBinder implements Binder {
  @override
  void bind() {
    /// [Sources]
    getIt.registerFactory<TodoDatasource>(
      () => TodoDatasourceRemoteImpl(
        firestore: FirebaseFirestore.instance
      ),
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

    /// [Controllers]
    getIt.registerFactory<CreateTodoController>(
      () => CreateTodoController(
        createTodoUsecase: getIt.get(),
      ),
    );
  }

  @override
  void dispose() {}
}
