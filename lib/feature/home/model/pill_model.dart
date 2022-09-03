import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

part 'pill_model.g.dart';

@HiveType(typeId: 0)
class PillModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String pillImage;

  @HiveField(3)
  bool isComplete;

  PillModel(
      {required this.id,
      required this.name,
      this.isComplete = false,
      required this.pillImage});

  factory PillModel.create(
          {required String title, required String pillImage}) =>
      PillModel(
          id: const Uuid().v1(),
          name: title,
          isComplete: false,
          pillImage: pillImage);
}
