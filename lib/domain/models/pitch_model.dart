class PitchModel {
  const PitchModel(
      {required this.title,
      required this.key,
      required this.url,
      required this.type,
      required this.image});

  final String title;
  final String key;
  final String url;
  final String type;
  final String image;

  @override
  String toString() {
    return 'PitchModel{title: $title, key: $key, url: $url, type: $type, image: $image}';
  }
}
