enum FrequencyEnum {
  none('None'),
  daily('Daily'),
  weekly('Weekly'),
  twiceADay('Twice A day'),

  everyOtherDay('Every other day');

  final String frequencyName;
  const FrequencyEnum(this.frequencyName);

  static List<String> get frequencyNames =>
      ['None', 'Daily', 'Weekly', 'Every other day', 'Twice A day'];
}
