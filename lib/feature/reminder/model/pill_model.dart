import 'package:hive_flutter/hive_flutter.dart';

part 'pill_model.g.dart';

@HiveType(typeId: 0)
class PillModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String? pillImage;

  @HiveField(2)
  bool isComplete;

  @HiveField(3)
  DateTime time;

  @HiveField(4)
  String alarmTime;
  @HiveField(5)
  String amount;
  PillModel(
      {required this.name,
      required this.amount,
      this.isComplete = false,
      required this.pillImage,
      required this.time,
      required this.alarmTime});

  factory PillModel.create(
          {required String title,
          String? amount,
          required String pillImage,
          required DateTime time,
          required String alarmTime}) =>
      PillModel(
          name: title,
          amount: amount ?? ' ',
          isComplete: false,
          pillImage: pillImage,
          time: time,
          alarmTime: alarmTime);
}
