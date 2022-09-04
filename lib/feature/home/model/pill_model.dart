import 'package:hive_flutter/hive_flutter.dart';
import 'package:medication_reminder_app/product/constants/enum/frequency_enum.dart';
import 'package:uuid/uuid.dart';

part 'pill_model.g.dart';

@HiveType(typeId: 0)
class PillModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String? pillImage;

  @HiveField(3)
  bool isComplete;

  @HiveField(4)
  DateTime? time;

  @HiveField(5)
  String frequency;

  @HiveField(6)
  String schedule;

  PillModel(
      {required this.id,
      required this.name,
      this.isComplete = false,
      required this.pillImage,
      this.time,
      required this.frequency,
      required this.schedule});

  factory PillModel.create(
          {required String title,
          required String pillImage,
          DateTime? time,
          String? frequency,
          String? schedule}) =>
      PillModel(
          id: const Uuid().v1(),
          name: title,
          isComplete: false,
          pillImage: pillImage,
          time: time ?? DateTime.now(),
          frequency: frequency ?? FrequencyEnum.none.name,
          schedule: 'After Dinner');
}
