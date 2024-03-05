import 'package:cloud_firestore/cloud_firestore.dart';

/// Classe responsável por converter timestamps em objetos DateTime e vice-versa.
class TimestampConverter {
  const TimestampConverter();

  /// Converte um objeto [Timestamp] em um [DateTime].
  static DateTime fromJson(Timestamp value) => value.toDate();

  /// Converte um objeto [DateTime] em um [Timestamp].
  static Timestamp toJson(DateTime value) => Timestamp.fromDate(value);
}
