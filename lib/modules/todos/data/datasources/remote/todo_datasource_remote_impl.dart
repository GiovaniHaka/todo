import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/modules/todos/data/datasources/todo_datasource.dart';
import 'package:todo/modules/todos/data/models/create_todo_model.dart';

class TodoDatasourceRemoteImpl implements TodoDatasource {
  final FirebaseFirestore _firestore;

  const TodoDatasourceRemoteImpl({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  @override
  Future<Either<Failure, void>> createTodo(CreateTodoModel value) async {
    try {
      await _firestore.collection('todos').add(value.toMap());

      return const Right(null);
    } catch (e, s) {
      return Left(Failure(error: e, stackTrace: s));
    }
  }
}
