extension ImageExtension on String {
  String get toPng => 'assets/image/img_$this.png';
  String get toBack => 'assets/background/back_$this.jpg';
  String get lottie => 'assets/lottie/lottie_$this.json';
  String get icon => 'assets/icon/icon_$this.png';
}
