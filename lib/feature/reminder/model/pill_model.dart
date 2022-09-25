import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/init/app/constants/cache_constants.dart';

part 'pill_model.g.dart';

@HiveType(typeId: CacheConstants.pillCacheTypeId)
class PillModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String? pillImage;

  @HiveField(2)
  bool isComplete;

  @HiveField(3)
  DateTime date;

  @HiveField(4)
  String time;

  @HiveField(5)
  String amount;

  PillModel(
      {required this.name,
      required this.amount,
      this.isComplete = false,
      required this.pillImage,
      required this.date,
      required this.time});

  factory PillModel.create(
          {required String title,
          String? amount,
          required String pillImage,
          required DateTime date,
          required String time}) =>
      PillModel(
          name: title,
          amount: amount ?? ' ',
          isComplete: false,
          pillImage: pillImage,
          date: date,
          time: time);
}
