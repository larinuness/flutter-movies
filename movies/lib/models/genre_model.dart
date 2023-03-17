class GenreModel {
  final int id;
  final String name;
  GenreModel({
    required this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
    );
  }
}
