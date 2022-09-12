enum SchedulEnum {
  beforeBreakfast('Before Breakfast'),
  afterBreakfast('After Breakfast'),
  beforeDinner('Before Dinner'),
  afterDinner('After Dinner');

  final String title;
  const SchedulEnum(this.title);

  static List<String> get scheduleEnums =>
      ['Before Breakfast', 'After Breakfast', 'Before Dinner', 'After Dinner'];
}
