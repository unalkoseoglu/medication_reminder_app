import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:medication_reminder_app/core/init/app/constants/cache_constants.dart';

import '../../feature/reminder/model/pill_model.dart';

abstract class ICacheManager<T> {
  final String key;

  ICacheManager(
    this.key,
  );
  late Box<T> box;
  void registerAdapters();
  Future<void> addItem(T item);
  Future<void> addAllItems(List<T> items);

  T? getItem(String key);
  T? getAtItem(int index);
  List<T>? getAllItem();

  Future<void> putItem(T item);
  Future<void> putAtItem(int index, T item);
  Future<void> putAllItems(List<T> items);

  Future<void> deleteItem(T item);
  Future<void> deleteAtItem(int index);
  Future<void> deleteAllItems(List<T> items);

  Future<void> clear();

  ValueListenable<Box<PillModel>> listenToReminder();
}

class PillCacheManager extends ICacheManager<PillModel> {
  PillCacheManager(super.key);
  @override
  Box<PillModel> get box => Hive.box<PillModel>(key);

  @override
  Future<void> addAllItems(List<PillModel> items) async =>
      await box.addAll(items);

  @override
  Future<void> addItem(PillModel item) async => await box.add(item);
  @override
  List<PillModel>? getAllItem() => box.values.toList();

  @override
  PillModel? getAtItem(int index) => box.getAt(index);

  @override
  PillModel? getItem(String key) => box.get(key);

  @override
  Future<void> putAllItems(List<PillModel> items) async =>
      await box.putAll(Map.fromEntries(items.map((e) => MapEntry(e.key, e))));

  @override
  Future<void> putAtItem(int index, PillModel item) async =>
      await box.putAt(index, item);

  @override
  Future<void> putItem(PillModel item) async => await box.put(item.key, item);

  @override
  Future<void> clear() async => await box.clear();

  @override
  Future<void> deleteAllItems(List<PillModel> items) async =>
      await box.deleteAll(items);

  @override
  Future<void> deleteAtItem(int index) async => await box.deleteAt(index);

  @override
  Future<void> deleteItem(PillModel item) async => await box.delete(item.key);

  @override
  ValueListenable<Box<PillModel>> listenToReminder() {
    return box.listenable();
  }

  @override
  void registerAdapters() {
    if (!Hive.isAdapterRegistered(CacheConstants.pillCacheTypeId)) {
      Hive.registerAdapter(PillModelAdapter());
    }
  }
}
