import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo/globals/failures/failure.dart';
import 'package:todo/modules/todos/data/datasources/todo_datasource.dart';
import 'package:todo/modules/todos/data/models/create_todo_model.dart';
import 'package:todo/modules/todos/data/models/todo_model.dart';
import 'package:todo/modules/todos/domain/enums/todo_status.dart';

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

  @override
  Stream<Either<Failure, List<TodoModel>>> streamTodos(String deviceId) async* {
    try {
      yield* _firestore
          .collection('todos')
          .where('deviceId', isEqualTo: deviceId)
          .orderBy('date', descending: true)
          .snapshots()
          .map(
        (snapshot) {
          log('Called');

          if (snapshot.docs.isEmpty) {
            return const Right([]);
          }

          final models = snapshot.docs.map(
            (e) {
              final map = e.data();
              map['id'] = e.id;
              return TodoModel.fromMap(map);
            },
          ).toList();

          return Right(models);
        },
      );
    } catch (e, s) {
      yield Left(Failure(error: e, stackTrace: s));
    }
  }

  @override
  Future<Either<Failure, void>> updateStatus({
    required String id,
    required TodoStatus status,
  }) async {
    try {
      await _firestore.collection('todos').doc(id).update({
        'status': status.status,
      });

      return const Right(null);
    } catch (e, s) {
      return Left(Failure(error: e, stackTrace: s));
    }
  }
}
