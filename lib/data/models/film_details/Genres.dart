/// id : 27
/// name : "Horror"

class Genre {
  Genre({
    this.id,
    this.name,
  });

  Genre.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  int? id;
  String? name;

  Genre copyWith({
    int? id,
    String? name,
  }) =>
      Genre(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
