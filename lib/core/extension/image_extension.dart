extension ImageExtension on String {
  String get toPng => 'assets/image/img_$this.png';
  String get lottie => 'assets/lottie/lottie_$this.json';
  String get icon => 'assets/icon/icon_$this.png';
}
