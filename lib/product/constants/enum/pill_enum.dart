enum PillEnum {
  capsule('capsule'),
  tablet('tablet'),
  liquid('liquid');

  final String pillName;
  const PillEnum(this.pillName);

  static List<String> get pillNames => ['capsule', 'tablet', 'liquid'];
}
