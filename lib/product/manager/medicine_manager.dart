import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../feature/home/model/pill_model.dart';

abstract class ICacheManager<T> {
  final String key;
  static const taskBoxName = 'medicin';
  final Box<PillModel> _box = Hive.box<PillModel>(taskBoxName);
  ICacheManager(this.key);

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
  Future<void> addAllItems(List<PillModel> items) async =>
      await _box.addAll(items);

  @override
  Future<void> addItem(PillModel item) async => await _box.add(item);
  @override
  List<PillModel>? getAllItem() => _box.values.toList();

  @override
  PillModel? getAtItem(int index) => _box.getAt(index);

  @override
  PillModel? getItem(String key) => _box.get(key);

  @override
  Future<void> putAllItems(List<PillModel> items) async =>
      await _box.putAll(Map.fromEntries(items.map((e) => MapEntry(e.id, e))));

  @override
  Future<void> putAtItem(int index, PillModel item) async =>
      await _box.putAt(index, item);

  @override
  Future<void> putItem(PillModel item) async => await _box.put(item.id, item);

  @override
  Future<void> clear() async => await _box.clear();
  @override
  Future<void> deleteAllItems(List<PillModel> items) async =>
      await _box.deleteAll(items);

  @override
  Future<void> deleteAtItem(int index) async => await _box.deleteAt(index);

  @override
  Future<void> deleteItem(PillModel item) async => await _box.delete(item.id);

  @override
  ValueListenable<Box<PillModel>> listenToReminder() {
    return _box.listenable();
  }
}
