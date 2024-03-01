import 'package:cloud_firestore/cloud_firestore.dart';

class TimestampConverter {
  const TimestampConverter();

  static DateTime fromJson(Timestamp value) => value.toDate();

  static Timestamp toJson(DateTime value) => Timestamp.fromDate(value);
}
