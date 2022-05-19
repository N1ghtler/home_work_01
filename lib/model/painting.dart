class Painting {
  final int id;
  final String name;
  final String artist;
  final int year;
  Painting({
    required this.id,
    required this.name,
    required this.artist,
    required this.year,
  });

  String get assetName => '$id.jpeg';
  String get assetPackage => 'assets/image/$assetName';
}
